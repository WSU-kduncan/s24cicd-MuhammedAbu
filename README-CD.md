# Project Description: 
  - Implemented semantic versioning into the github workflow using git tag.
  - Utilized webhooks to automatically deploy new container images on an AWS instance.

## Diagram:
- Here's a diagram illustrating the continuous deployment process.
  - Utilized draw.io to visualize the CD pipeline.
  - Labeled tools used and connections between components.

## Diagram: 
### Part 1 - Semantic Versioning
1. To create a git tag, use the `git tag` command followed by the name of the tag you want to create. Here's a basic example:

```bash
git tag v1.0
```

This command creates a lightweight tag named "v1.0" at the current commit. Lightweight tags are essentially just a pointer to a specific commit.

To create an annotated tag, which includes additional information such as a message, you can use the `-a` flag along with the `-m` flag to specify the tag message:

```bash
git tag -a v1.0 -m "Release version 1.0"
```

This command creates an annotated tag named "v1.0" with the message "Release version 1.0".

After creating a tag, you can push it to your remote repository by running the `git push` command and the name of your tag:

```bash
git push origin <tagname>
```

Replace `<tagname>` with the name of the tag you want to push. If you want to push all tags, you can use the `--tags` option:

```bash
git push origin --tags
```

This command pushes all tags to the remote repository. If you remote repo isnt named origin you can replace it with the name of the remote repo that you are using. 

Creating tags can be useful for marking releases or important points in your Git history. 
3. Updated GitHub Action workflow to:
   - Run when a tag is pushed.
   - Utilized docker/metadata-action to generate tags.
   - Pushed images to DockerHub with tags based on git tag version and `latest`.

**Documentation:**
- Created `README-CD.md` with:
  - CD Project Overview: Detailed explanation of the project's purpose, tools used, and objectives.
  - Guide on generating tags in git/GitHub: Step-by-step instructions on creating tags using semantic versioning.
  - Explanation of GitHub workflow: Description of how the GitHub Action workflow operates, triggered by tag pushes.
  - Link to Docker Hub repository: Provided a link to the Docker Hub repository for additional verification.
  - Resources: Included links to relevant resources like docker/metadata-action and Docker documentation.

### Part 2 - Deployment
**Tasks Completed:**
1. Installed Docker on an EC2 instance.
2. Pulled and ran a container from DockerHub image.
3. Created a script to pull a new image from DockerHub and restart the container.
4. Set up a listener/hook using adnanh's webhook to receive messages.
5. Configured DockerHub to send messages to the listener/hook.

**Documentation:**
- Updated `README-CD.md` with:
  - Installation guide for Docker: Detailed steps to install Docker on an EC2 instance.
  - Description of container restart script: Explanation of the script's purpose and functionality.
  - Guide on setting up webhook listener: Step-by-step instructions for configuring and starting the webhook listener.
  - Configuration guide for DockerHub: Instructions on configuring DockerHub to send messages to the webhook listener.
  - Proof of CD workflow: Provided proof of successful CD workflow execution, including GitHub Action logs, DockerHub images, and webhook logs.


---
## Helpful commands:
Here is a list of basic commands for Git tags, Docker, GitHub Actions, and Docker Hub that will help with version control, containerization, CI/CD workflows, and image management:

### Git Tags:

- **Create a Tag:**
  ```bash
  git tag <tagname>
  ```
  or
  ```bash
  git tag -a <tagname> -m "Tag message"
  ```

- **List Tags:**
  ```bash
  git tag
  ```

- **Show Tag Information:**
  ```bash
  git show <tagname>
  ```

- **Push Tags to Remote:**
  ```bash
  git push origin <tagname>
  ```
  or
  ```bash
  git push origin --tags
  ```

- **Delete a Tag Locally:**
  ```bash
  git tag -d <tagname>
  ```

- **Delete a Tag on Remote:**
  ```bash
  git push --delete origin <tagname>
  ```

### Docker:

- **Build Docker Image:**
  ```bash
  docker build -t <image-name>:<tag> .
  ```

- **Run Docker Container:**
  ```bash
  docker run -d <image-name>:<tag>
  ```

- **List Docker Images:**
  ```bash
  docker images
  ```

- **List Docker Containers:**
  ```bash
  docker ps
  ```

- **Stop Docker Container:**
  ```bash
  docker stop <container-id>
  ```

- **Remove Docker Container:**
  ```bash
  docker rm <container-id>
  ```

- **Remove Docker Image:**
  ```bash
  docker rmi <image-name>:<tag>
  ```

### GitHub Actions:

- **Workflow Syntax Checking:**
  ```bash
  github action syntax workflow.yml
  ```

- **Trigger a Manual Workflow Dispatch:**
  This triggers a GitHub Actions workflow manually.
  
  You can find this option on the GitHub UI under the "Actions" tab.

- **Workflow Logs:**
  You can view workflow logs in the GitHub UI under the "Actions" tab.

### Docker Hub:

- **Login to Docker Hub:**
  ```bash
  docker login
  ```

- **Push Docker Image to Docker Hub:**
  ```bash
  docker push <image-name>:<tag>
  ```

- **Pull Docker Image from Docker Hub:**
  ```bash
  docker pull <image-name>:<tag>
  ```
## Helpful commands pt. 2
Here is an appended list of addional helpful commands that are more advanced but just as useful as the previously listed basic commands:
### Git Tags:

- **List Tags with Commit Hashes:**
  ```bash
  git show-ref --tags
  ```

- **Push All Tags to Remote:**
  ```bash
  git push origin --tags
  ```

- **Checkout a Specific Tag:**
  ```bash
  git checkout tags/<tagname>
  ```

- **Search for Tags by Pattern:**
  ```bash
  git tag -l "pattern*"
  ```

### Docker:

- **Build Docker Image with Build Args:**
  ```bash
  docker build --build-arg <key>=<value> -t <image-name>:<tag> .
  ```

- **Run Docker Container with Port Mapping:**
  ```bash
  docker run -d -p <host-port>:<container-port> <image-name>:<tag>
  ```

- **Inspect Docker Container:**
  ```bash
  docker inspect <container-id>
  ```

- **Prune Unused Docker Resources:**
  ```bash
  docker system prune
  ```

### GitHub Actions:

- **View Workflow Run Logs:**
  ```bash
  gh run view <workflow-run-id>
  ```

- **List Workflow Runs:**
  ```bash
  gh run list
  ```

- **Cancel a Workflow Run:**
  ```bash
  gh run cancel <workflow-run-id>
  ```

### Docker Hub:

- **Inspect Docker Image:**
  ```bash
  docker image inspect <image-name>:<tag>
  ```

- **List Docker Hub Repositories:**
  ```bash
  curl -u <username>:<password> https://hub.docker.com/v2/repositories/<username>
  ```

- **Delete Docker Image from Docker Hub:**
  ```bash
  curl -X DELETE -u <username>:<password> https://hub.docker.com/v2/repositories/<username>/<repository>/tags/<tag>/
  ```

These additional commands should provide functionality and control over Git tags, Docker containers and images, GitHub Actions workflows, and Docker Hub repositories.



