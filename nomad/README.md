# Nomad

If you don't know what nomad is, read this(https://www.nomadproject.io/intro/index.html)  
In my opinion kubernetes is hyped and bloated, nomad is the taking the unix philosophy and applying it to kuberenetes.  

## Requirments
- A working docker set up on your unraid server

## Steps
1. Create `/boot/custom_bin`
2. Download nomad and put the bin in `/boot/custom_bin`
3. Create a share called `homelab`
4. Create folder structure `mkdir -p /mnt/user/homelab/nomad/logs`
5. Create folder structure `mkdir -p /mnt/user/homelab/nomad/config`
6. Copy `config/main.hcl` to `/mnt/user/homelab/nomad/config/main.hcl`
7. Install CA User Scripts plugin (lets us run scripts on array startup and shutdown)
8. Copy the 2 folders (`start_homelab` & `stop_homelab`) under scripts to `/boot/config/plugins/user.scripts/scripts`
9. Go to your unraid UI `Settings/Userscripts`
10. Set `start_homelab` to `At Startup of Array`
11. Set `stop_homelab` to `At Stopping of Array`


## Why have a stop
If there are some containers that have access to volume root that are a little eager to create folders I wanted to avoid issues where the raid was offline but the docker container created `/mnt/user/<something>`

## Using nomad
Install the nomad bin on your local machine and set an env var called `NOMAD_ADDR="http://<your unraid ip>:4646"`  
Now you can run jobs from the job_specs folder.  
To start a instance of the ghost blogging platform `nomad run job_specs/ghost.nomad`

## Todo
- Add consul
- Add vault
