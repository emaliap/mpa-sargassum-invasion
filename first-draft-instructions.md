# Blog post first draft for your final project

Your final project is a **_technical blog post_** that uses a statistical model to answer an environmental data science question. The full description and rubric are on the [course website](https://eds-222-stats-f26.github.io/final-project.html).

This first draft is the third checkpoint for that project. Like all the final project checkpoints, it is ungraded. Its purpose is to get feedback on a **complete** version of your blog post while there's still time to revise it. A first draft doesn't have to be polished, but every part of the rubric should be there. The more complete your draft, the more useful the feedback.

## 1. Set up your project repository

Your exploratory analysis and proposal lived in your homework repos. Your final project gets a repository of its own. The rubric assesses whether "the project repository is well-organized and appropriately documented," and this repo will be part of your portfolio, so set it up carefully now.

1. Create a new GitHub repository for your project and clone it to your directory on Workbench.
2. Organize it using the [folder organization system](https://eds-214-reproducibility-m26.github.io/course-materials/resources/folder-organization.html) from EDS 214. You won't need every folder. At a minimum, your repo will probably look something like this:

    ```
    .
    ├── README.md
    ├── _quarto.yml # tells Quarto to render your blog post into docs/
    ├── data/       # raw input data and metadata (never edited by hand)
    ├── docs/       # rendered blog post, published with GitHub Pages
    ├── output/     # cleaned data and other intermediate files
    ├── R/          # R scripts with function definitions
    └── reports/
        └── blog-post.qmd
    ```

    Follow the system's rules: never edit your raw data, and make every change to it in code, saving the results to `output/`. Never edit the files in `docs/` by hand either. They're overwritten every time you render.

3. Write a `README.md` following the [MEDS README guidelines](https://ucsb-meds.github.io/README-guidelines/). It must include everything on the guidelines' "always include" list:
    - [ ] A short, descriptive title (not just the repository name)
    - [ ] A brief explanation of the repository's purpose
    - [ ] A concise description of the contents, including the repository structure (try `tree`)
    - [ ] Data access details: where the data come from and how someone else can get them to run your code
    - [ ] Authors or contributors
    - [ ] References and/or acknowledgements, including your data sources

> [!IMPORTANT]
> Large data files can't be pushed to GitHub. If your data are too large, list the files in `data/` in your `.gitignore` so they stay on Workbench but out of your commits. Your README's data access details should then explain how someone else could download them.

## 2. Publish your blog post with GitHub Pages

Your blog post is a portfolio piece, so it should be readable by anyone with a link, not just by people who clone your repo. You'll render it into `docs/` and publish it with [GitHub Pages](https://docs.github.com/en/pages).

1. Create a file named `_quarto.yml` in the root of your repository with the following contents:

    ```yaml
    project:
      output-dir: docs
      execute-dir: project
      render:
        - reports/blog-post.qmd
    ```

    `output-dir: docs` puts the rendered HTML in `docs/`. `execute-dir: project` runs your code from the root of the repository, so file paths in your blog post (like `data/my-data.csv`) are relative to the root, not to `reports/`.

2. Render your blog post from the root of your repository, either with the **Render** button in RStudio or by running `quarto render` in the terminal. Check that `docs/reports/blog-post.html` was created.

3. Create an empty file named `.nojekyll` in `docs/` (in the terminal, `touch docs/.nojekyll`). This tells GitHub Pages to serve your files as they are.

4. Commit and push everything, _including_ `docs/`.

5. On GitHub, go to your repository's **Settings** > **Pages**. Under **Build and deployment**, set the source to **Deploy from a branch**, then choose the `main` branch and the `/docs` folder, and click **Save**. After a minute or two, your blog post will be live at:

    ```
    https://<your-github-username>.github.io/<your-repo-name>/reports/blog-post.html
    ```

6. Add that link to your README, and to your repository's **About** section (click the gear icon on your repository's main page), as the MEDS README guidelines recommend.

> [!IMPORTANT]
> GitHub Pages only shows what you've pushed. Every time you revise your blog post, re-render it and push the updated `docs/` folder, or the published version will be out of date.

> [!NOTE]
> Your repository must be public to publish with GitHub Pages on a free account.

## 3. Write your first draft

Write your blog post in `reports/blog-post.qmd`. You may reuse text, code, and figures from `eda.qmd` and `proposal.qmd`, but revise them based on the feedback you received.

Your draft should address every criterion in the final project rubric from the [course website](https://eds-222-stats-f26.github.io/final-project.html#rubric):

### Question and data (15%)

- [ ] The blog post provides context and background for the question
- [ ] The data are explained using text and figures
- [ ] The theorized causal relationships are described with a DAG

### Statistical model (35%)

- [ ] The statistical model is explained conceptually and using formal statistical notation
- [ ] The choice of model is justified based on the characteristics of the data and model assumptions
- [ ] Potential limitations of the model and data are considered

### Inference (35%)

- [ ] Hypotheses are stated in plain language and with visualizations
- [ ] Model estimates are presented with appropriate uncertainty
- [ ] A hypothesis is tested and the evidence is interpreted

### Professionalism (15%)

- [ ] The overall appearance of the blog post (e.g., figures, code outputs) is portfolio-quality
- [ ] The writing is comprehensible to a technical audience
- [ ] The project repository is well-organized and appropriately documented

> [!TIP]
> In your proposal, you identified the _type_ of your response variable (prompt 3.2). Now that we've covered generalized linear models, revisit that answer when you choose and justify your model.

## 4. Questions for feedback

At the end of your blog post, add a short section titled "Questions for feedback." What part of your analysis are you least sure about? What specific feedback would help you most as you revise for the final draft? You'll remove this section before the final draft.

## 5. Submit

In this homework repo, create a file named `project-link.md` containing two links:

1. Your project repository on GitHub
2. Your published blog post on GitHub Pages

Before you submit, open the GitHub Pages link in a private browser window to make sure it works and shows your latest draft.
