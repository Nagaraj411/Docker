🧱 Dockerfile Instructions (Explained with Tips)
    # 🐳 Dockerfile Instructions – Cheat Sheet

A quick guide to essential Dockerfile instructions:

| 🔤 **Instruction** |         🧠 **Purpose**                                               | 🧪 **Example**                                     | 💡 **Tip to Remember**                     |
|---------------------|------------------------------------------------------------|---------------------------------------------------|-----------------------------------------------|
| 🏗️ **FROM**        | Sets the **base image**                                     | `FROM ubuntu:20.04`                               | Always the **first line** (starts the build)  |
| 🏷️ **LABEL**       | Adds **metadata** to the image                              | `LABEL maintainer="you@example.com"`              | Like a **tag** for information/search         |
| 📦 **ADD**         | Adds **files/folders**, supports **URL** & **tar**          | `ADD app.tar.gz /app/`                            | Can **unzip** archives automatically          |
| 📁 **COPY**        | Copies files/folders from build context into image          | `COPY . /app`                                     | Safer than ADD (no unzip/URL)                 |
| 🔧 **RUN**         | Executes **commands** during image build                    | `RUN apt-get update && apt-get install -y nginx`  | Think: **Install software or configure**      |
| 🚀 **CMD**         | Sets default **container startup command**                  | `CMD ["nginx", "-g", "daemon off;"]`              | Only one `CMD` allowed; can be overridden     |
| 🌐 **EXPOSE**      | Documents the **port** the app uses                         | `EXPOSE 80`                                       | Just **informs**, doesn’t publish the port    |
| 📁 **WORKDIR**     | Sets the working directory for instructions after it        | `WORKDIR /app`                                    | Automatically creates it if it doesn’t exist  |
| 👤 **USER**        | Sets the user to run the container                          | `USER appuser`                                    | Avoid using root in production                |
| 🌍 **ENV**         | Defines environment variables inside the image              | `ENV PORT=8080`                                   | Overridable using docker run -e PORT=1234     |
| 🚀 **ENTRYPOINT**  | Sets the main command that always runs                      | `ENTRYPOINT ["python3", "main.py"]`               | Combine with CMD to support default args      |

---

### 📘 Sample Dockerfile

```Dockerfile
FROM ubuntu:20.04
LABEL maintainer="you@example.com"
ADD app.tar.gz /app
COPY config.json /app/config.json
RUN apt-get update && apt-get install -y nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
