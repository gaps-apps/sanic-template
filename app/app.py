from sanic import Sanic
from sanic.response import text
import os


def create_app():
    app = Sanic("MyHelloWorldApp")

    @app.get("/")
    async def hello_world(request):
        return text(f"Hello, world{ os.getenv('VAR1') }")

    return app
