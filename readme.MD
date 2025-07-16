🧱 Dockerfile Instructions (Explained with Tips)
    Instruction	Purpose	Example	💡 Tip to Remember
    FROM	Sets the base image	FROM ubuntu:20.04	Always the first line (starts the build)
    LABEL	Adds metadata to the image	LABEL maintainer="you@example.com"	Like a tag for information/search
    ADD	Adds files/folders to image + supports URL / tar	ADD app.tar.gz /app/	Can unzip archives automatically
    COPY	Copies files/folders into image	COPY . /app	Safer, simpler than ADD (no unzip/URL)
    RUN	Runs shell commands during build	RUN apt-get update && apt-get install -y nginx	Think: Install software or configure
    CMD	Sets default command to run when container starts	CMD ["nginx", "-g", "daemon off;"]	Only one CMD allowed; can be overridden
    EXPOSE	Documents which port the app uses	EXPOSE 80	Just informs, doesn't publish the port
    