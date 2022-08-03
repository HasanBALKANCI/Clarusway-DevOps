FROM ubuntu # zorunlu komut, ubuntudan build yap
RUN apt-get update -y # her run bir layer olusturur
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install flask
COPY . /app
WORKDIR /app
CMD python3 ./welcome.py # containerda default calistirilacak uygulamayi belirtir