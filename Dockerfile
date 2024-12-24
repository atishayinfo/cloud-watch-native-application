# Use the official Python image as a base image
FROM python:3.9-buster

# Set the working directory in the container
WORKDIR /app

# Copy the application's requirements file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Gunicorn
RUN pip3 install --no-cache-dir gunicorn

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application will run on
EXPOSE 5000

# Set the command to run Gunicorn
# - `-w 4` specifies 4 worker processes
# - `-b :5000` binds Gunicorn to all available network interfaces on port 5000
# - `app:app` refers to the module and application instance
CMD ["gunicorn", "-w", "4", "-b", ":5000", "app:app"]
