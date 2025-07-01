from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "InfraCopilot Controller Running"}

@app.get("/status")
def status():
    return {"status": "OK"}
