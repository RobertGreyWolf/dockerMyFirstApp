# our base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy files required for the app to run
COPY app.py /app/
COPY templates/index.html /app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/app/app.py"]