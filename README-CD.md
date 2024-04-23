Project Description: 
  - Used git tag metadata and github actions to implement semantic vesioning. Used webhook to deploy docker image to remote instance.
    
### Part 1 - Semantic Versioning
**Tasks Completed:**
1. Practiced creating tags for commits using semantic versioning.
2. Updated GitHub Action workflow to:
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

### Part 3 - Diagramming
- Created a diagram illustrating the continuous deployment process.
  - Utilized Lucidchart to visualize the CD pipeline.
  - Clearly labeled tools used and connections between components.
  - Placed the diagram near the project description in the repository for easy reference.


