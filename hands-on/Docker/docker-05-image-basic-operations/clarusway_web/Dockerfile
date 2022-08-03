FROM ubuntu
RUN apt-get update -y # her komut icin bir layer olusturur.
RUN apt-get install python3 -y # ikinci layer
RUN apt-get install python3-pip -y # ucuncu layer
RUN pip3 install flask # dorduncu layer
COPY . /app # bulundugun klasordeki tum dosyalari, filelari app icine kopyala, app yoksa olustur
WORKDIR /app # cd gibi calisir. app in icine git
CMD python3 ./welcome.py # cmd kontainer olustuktan sonra python3 ile bulunan klasorun altind