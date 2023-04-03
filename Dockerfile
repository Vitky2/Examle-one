FROM python:3

WORKDIR /usr/src/app

COPY APIcalc.py ./ 
 
COPY requirements.txt ./ 

RUN pip install --upgrade pip  

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir -r flask

EXPOSE 8000

CMD ["python", "APIcalc.py"]
