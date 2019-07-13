from flask import Flask, render_template, request, session, redirect,flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime
with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)




class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Feedback(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)



class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    mname = db.Column(db.String(12), nullable=True)

class User_reg(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(21), nullable=False)
    password = db.Column(db.String(120), nullable=False)


@app.route("/")
def home():
    name="User Panel"
    if ('user1' in session):
        name = "Welcome "+session['user1']
    posts = Posts.query.filter_by().all()
    posts = posts[::-1]
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page= int(page)
    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    if (page==1):
        prev = "#"
        next = "/?page="+ str(page+1)
    elif(page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)



    return render_template('index.html', params=params, posts=posts, prev=prev, next=next,sp=name)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post,sp=name)

@app.route("/about")
def about():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    return render_template('about.html', params=params,sp=name)





@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts = posts,sp=name)
    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts = posts,sp=name)
    return render_template('login.html', params=params)


@app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    name=""
    sp="User Panel"
    if('user' in session and session['user'] == params['admin_user']):
        name="Admin"
    if('user1' in session):
        name = session['user1']
        sp="Welcome " + session['user1']
    if (('user' in session and session['user'] == params['admin_user']) or 'user1' in session):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if(sno=='0'):
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, date=date,img_file=img_file,mname=name )
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = request.form.get('title')
                post.slug = request.form.get('tline')
                post.content = request.form.get('slug')
                post.tagline = request.form.get('content')
                post.img_file = request.form.get('img_file')
                post.date = datetime.now()
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post,sno=sno,sp=sp)


@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename) ))
            return "Uploaded successfully"
@app.route("/logout")
def logout():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    posts = Posts.query.filter_by().all()
    posts = posts[::-1]
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_posts']): (page - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]
    if (page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)
    if ('user' in session):
        session.pop('user')
        return redirect('/')
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next,sp=name)

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if (('user' in session and session['user'] == params['admin_user']) or 'user1' in session):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        if('user' in session):
            return redirect('/dashboard')
        if('user1' in session):
            return redirect('/dashboard1')

    return redirect('/')



@app.route("/user_reg", methods = ['GET', 'POST'])
def user_reg():
    name1 = "User Panel"
    if ('user1' in session):
        name1 = "Welcome " + session['user1']
    if (request.method == 'POST'):
        name=request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')
        entry = User_reg(name=name, email=email,password=password)
        db.session.add(entry)
        db.session.commit()
    return render_template('user_reg.html', params=params,sp=name1)



@app.route("/dashboard1", methods=['GET', 'POST'])
def dashboard1():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    if('user1' in session):
        posts = Posts.query.filter_by(mname=session['user1']).all()
        return render_template('dashboard1.html', params=params, posts=posts,sp=name)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        users = User_reg.query.filter_by().all()
        i = 0
        msg = " Invalid Username or Password "
        for user in users:
            if (user.name == username and user.password == userpass):
                i = 1
        if (i == 1):
            session['user1'] = username
            posts = Posts.query.filter_by(mname=session['user1']).all()
            return render_template('dashboard1.html', params=params, posts=posts,sp=name)

    return render_template('user_login.html', params=params,sp=name)

@app.route("/user_logout", methods = ['GET', 'POST'])
def user_logout():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    posts = Posts.query.filter_by().all()
    posts=posts[::-1]
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_posts']): (page - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]
    if (page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)


    if('user1' in session):
        session.pop('user1')
        return redirect('/')
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next,sp=name)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   recipients=[email],
        #                   sender=email,
        #                   body = message + "\n" + phone
        #                   )
        flash('Thanks for giving your feedback')
    return render_template('contact.html', params=params,sp=name)


@app.route("/contactt", methods = ['GET', 'POST'])
def contactt():
    return render_template('contactt.html', params=params)



@app.route("/feedback", methods = ['GET', 'POST'])
def feedback():
    name = "User Panel"
    if ('user1' in session):
        name = "Welcome " + session['user1']
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Feedback(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   recipients=[email],
        #                   sender=email,
        #                   body = message + "\n" + phone
        #                   )
    return render_template('feedback.html', params=params,sp=name)



app.run(debug=True)
