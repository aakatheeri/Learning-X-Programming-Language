#import web.py framework
import web

# identify urls of web app
urls = (
    '/', 'Index',
    '/about', 'About'
)

# render template from selected path
render = web.template.render('templates/')

# identify Index class to be used for index url representation
class Index:
    def GET(self):
        greeting = "Hello World!"
        return render.index(greeting = greeting)

# indetify About class tobe used for About url representation
class About:
    def GET(self):
        message = "About Page"
        return message;

# check if below global variable has same value
if __name__ == "__main__":
    # configure urls
    app = web.application(urls, globals())

    # run web app
    app.run()
