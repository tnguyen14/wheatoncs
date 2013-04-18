#Wheaton College CS Club Members Page

###Create your own member page

URL: [http://apollo.wheatoncollege.edu/csclub/](http://apollo.wheatoncollege.edu/csclub)

##Documentation

###How to run it locally
You can easily do a ``git clone`` to download the code to your computer. Since this is just HTML/CSS/JavaScript, any computer with a browser will be able to render.

###How to push changes to the live site
Changes to the site could be made through ``pull requests``.

1. [fork](/tnguyen14/wheatoncs/fork_select) this repo,
2. make changes to it as much as you would like, then
3. create a ``pull request``.

[More help on using Pull Requests](https://help.github.com/articles/using-pull-requests)

###How to build your own website
1. Create your own page with the format ``your-name.html`` in the ``members`` folder.
2. Follow the template in ``tri.html`` to see how different elements (links, stylesheets etc.) are pulled in and follow.
3. Feel free to make changes and add anything within the ``<div class="page">`` element.
4. Create your own ``your-name.css`` stylesheet in the ``css`` folder. Remember to link this stylesheet to your specific html page by replacing ``<link rel=stylesheet" href="../css/tri.css">`` with your own.
5. Add your own preview on the homepage by following the template of ``<div class="member-preview">`` in ``index.html``
6. If you have any question, feel free to [contact Tri](mailto:nguyen_tri@wheatonma.edu) or [create an issue](https://github.com/tnguyen14/wheatoncs/issues).

###HTML and CSS resources
You can find further resources on HTML and CSS at the following resources:
- [MSDN Channel 9 Beginners' Guide to HTML5 & CSS3](http://channel9.msdn.com/Series/HTML5-CSS3-Fundamentals-Development-for-Absolute-Beginners)
- [Mozilla Developer Network CSS Reference](https://developer.mozilla.org/en/CSS/CSS_Reference)
- [CSS-Tricks](http://css-tricks.com) - An amazing resource for web development all around.

###Deployment
Here's how you can start deploying, i.e. push all the changes from this Github repo to the live URL.

1. Install [capistrano](http://capify.org) on your computer. If you're not sure how to do that, [this might help](https://github.com/capistrano/capistrano/wiki/2.x-Getting-Started).
2. Create a new user account on apollo. In order to do this, please [contact the admin](mailto:nguyen_tri@wheatonma.edu). Note to admin: add the user to the group `webusers`.
3. Initilize capistrano by running `capify .` on the git directory.
4. Configure `config/deploy.rb`. Here's an example config:

		set :application, "wheatoncs"
		set :repository,  "git@github.com:WheatonCollegeCSClub/wheatoncs.git"
		set :deploy_to, "/var/www/html/csclub"
		set :branch, "master"

		# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
		# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

		role :web, "155.47.41.30"                          # Your HTTP server, Apache/etc
		role :app, "155.47.41.30"                          # This may be the same as your `Web` server
		role :db,  "155.47.41.30", :primary => true # This is where Rails migrations will run
		#role :db,  "your slave db-server here"

		# if you want to clean up old releases on each deploy uncomment this:
		# after "deploy:restart", "deploy:cleanup"

		set :user, "your apollo server username"
		set :scm_user, "your github username"
		set :deploy_via, :remote_cache

		# if you're still using the script/reaper helper you will need
		# these http://github.com/rails/irs_process_scripts

		set :use_sudo, true
		efault_run_options[:pty] = true

5. Set up SSH key authentication between your computer with the server. Follow these steps:
	. `ssh-keygen` on your computer. Note the key name you choose. The default is `id_rsa`.
	. Copy your ssh public key, in this case `id_rsa.pub` to a file named `authorized_keys` which is in the `.ssh` folder of your home folder on the server. (If this file doesn't exist, create it).
	. Test that your ssh password-less login is working by running `ssh your-user-name@apollo.wheatoncollege.edu` on your computer. If it lets you in, it works!

6. Set up authentication between the server and the Github repo.
	. Run `ssh-keygen` again, this time from your home folder on the server. Note the key name, default again is `id_rsa`.
	. Copy the public key, in this case `id_rsa.pub`.
	. Go to the Github repo -> Settings -> Deploy Keys. Create a new key and paste the content in there. (Please note you might not have access to this. If this is the case, please (contact the repo owner)[mailto:nguyen_tri@wheatonma.edu].)
	. Test to see that it works by `ssh git@github.com` from the server. If it works, you should get a message like this `You've successfully authenticated, but GitHub does not provide shell access.  Connection to github.com closed.`
	. You should really give yourself a pat in the back for getting this far!

7. Set up and deploy!
	. From your local repo (on your machine), runs `cap deploy:setup`. Do this only once. If it is set up successfully, it will be indicated so. If not, it will throw errors. If this does, bang your head on the table 5 times and figure out how to fix it.
	. Before every deploy, you should run `cap deploy:check`. If everything is ok, complete the final step of running `cap deploy`. Woohoo! You've done it!