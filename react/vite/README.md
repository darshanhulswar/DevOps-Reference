# This Docker file configuration for the apps bundled using React + Vite

When you are running React + Vite on Ubuntu server, ensure that run dev server using the following arguments to allow it can be accessed over the network

The scripts under `package.json` might look like this:
```
"scripts": {
    "dev": "vite --port 9001 --host",
    "build": "vite build",
    "lint": "eslint .",
    "preview": "vite preview"
  },
```

Then run the docker container
```
docker run -it -t --name <container_name> -p 5173:9001 <img_id>
```

