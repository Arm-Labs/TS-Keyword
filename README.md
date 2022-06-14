# TS-Keyword
Welcome to the Arm Laboratory repository where we are experimenting with using the Arm Total-Solution Keyword detection software in the Open-IoT-SDK project to utilize the GitHub Custom Runner feature.

To take the GitHub Custom runner feature for a spin, clone the repository, modify a file and push those changes back to the repository, automatically starting a Continous-Integration (CI) process.


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
4. In a browser, go to the GitHub [TS-Keyword](https://github.com/Arm-Labs/TS-Keyword) Custom runner repository.
5. Click on **Actions** or Click on this link [TS-Keyword Actions](https://github.com/Arm-Labs/TS-Keyword/actions).
   * You should see your run using the **commit message** that you entered above.
   * Click on the hyperlinked commit message to go to the workflow run.
6. Click on the workflow name in the box, **ci_build_and_test_ats_keyword_112**
   * This will show you all the steps that make up this workflow.
   * You can expand each one to see the results of that step.
7. The results of the run will be shown on the action screen with a Green checkmark or a Red X.