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


