FROM python:3.10-slim

# تحديث الحزم وتثبيت الأدوات والمكتبات المطلوبة لـ face_recognition و dlib
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgl1-mesa-glx \
    python3-dev \
    libboost-all-dev \
    libglib2.0-0 \

    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
