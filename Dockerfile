# استخدمي نسخة Python مناسبة
FROM python:3.12-slim

# تثبيت libGL علشان opencv يشتغل
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# تعيين فولدر العمل
WORKDIR /app

# نسخ ملفات المشروع
COPY . .

# تثبيت المتطلبات
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# البورت اللي هيشتغل عليه السيرفر
EXPOSE 8000

# أمر التشغيل
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
