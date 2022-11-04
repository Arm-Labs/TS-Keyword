# TS-Keyword 
Welcome to the Arm Laboratory repository where we are experimenting with using the Arm Total-Solution Keyword detection software in the Open-IoT-SDK project to utilize the GitHub Custom Runner feature.

There are 2 ways to trigger the runner workflow, via a code change or manually starting the workflow.

## Manual workflow execution

If you simply want to execute the runner workflow configured in this repository, you can take advantage of the **workflow_dispatch** option via the Actions page.  See the steps below.

1. In a new browser window, open the [TS-Keyword Actions](https://github.com/Arm-Labs/TS-Keyword/actions) link.
2. Select the **simple-ci-112** entry on the left, you will then see a row that looks like this:
   > This workflow has a workflow_dispatch event trigger. . .  **Run Workflow**
3. Click on the **Run Workflow** button on the right.
   * In the drop down menu choose **Run Workflow**

Skip down to the [Runner observation](#runner-observation) instructions below.
## Code change execution

To experiment with a normal developer flow and take GitHub Custom runner feature for a spin, clone the repository, modify a file and push those changes back to the repository, automatically starting a Continous-Integration (CI) process.

1. Clone the repository
    ```sh
    git clone https://github.com/Arm-Labs/TS-Keyword.git; cd TS-Keyword
    ```
2. Edit a file
    ```sh
     vi README.md
    ```
3. Use git commands to add, create a commit message, and then push to the repo.
    ```sh
     git add README.md
    ```
    ```sh
     git commit -m "Simple update"
    ```
    ```sh
     git push origin main
    ```
Skip down to the [Runner observation](#runner-observation) instructions below.

## Runner observation
Follow the instructions below to find your runner action.

1. In the browser showing the [TS-Keyword](https://github.com/Arm-Labs/TS-Keyword) repository page:
   * click on **Actions** or Click on this link [TS-Keyword Actions](https://github.com/Arm-Labs/TS-Keyword/actions).
   * You should see your run using the **commit message** that you entered above or if you **manually** started the workflow you will see the name of the workflow at the top: **simple-ci-112**.
   * Click on the hyperlinked message/name to go to the workflow run.
1. On the specific **runs** page, click on the workflow name in the box, **ci_build_and_test_ats_keyword_112**
   * This next page will show you all the steps that make up this workflow.
   * You can expand each one to see the results of that step.
1. The results of the run will be shown on the action screen with a Green checkmark or a Red X.
