---
title: "Create Github Profile based on README"
date: 2022-01-10T11:52:00+08:00
tags: ["github", "profile"]
categories: ["Git"]
draft: false
---

## Introduction {#introduction}

If you visit other peoples GitHub profiles, some people have some fancy **pictures**, **descriptions** and **stats** in their **profiles**. These are the new GitHub Profile **README**. They are kind of a hidden new feature and in this article I will show you how to create one and how make it stand out using some cool tricks and tools!

{{< figure src="http://res.cloudinary.com/dkvj6mo4c/image/upload/v1641783755/screenshot/webleuai74noouki9wy7.png" >}}


## First Step: Crate new Github repository {#first-step-crate-new-github-repository}

You should create a new repository, which name should same as your GitHub's **Username**.

In my case that would be **yanboyang713/yanboyang713**.

{{< figure src="http://res.cloudinary.com/dkvj6mo4c/image/upload/v1641707032/screenshot/eenmrezaanurdatesvrx.png" >}}

Please, have a look this [Git/An introduction for Git/Create a repository]({{< relref "git#create-a-repository" >}}) for create new one.


## Make It Stand Out {#make-it-stand-out}

We have a repository with **README**, but what about the content? You could just throw in some information about yourself, your email contact and call it a day, but we can do better.

One thing I would suggest to add is a nice **header** to make it more **personalized**. You could include your **name** or **job title** in it, content is up to you. There are a lot of examples of very nice and creative headers, e.g:

1.  <https://github.com/WaylonWalker/WaylonWalker>
2.  <https://github.com/SidharthArya/SidharthArya>

Now, how to add it into README? First, add the **header** picture to your repository, so that you have it hosted publicly. Next, include following line at the top of README.md

```md
# [![Header](https://raw.githubusercontent.com/yanboyang713/yanboyang713/main/hearder.png)](https://yanboyang.com/)
```


## Add contents {#add-contents}

There are a couple of **TIPS**, add your **Blog** post, **GitHub** activity, **Starred**, Top **Followers** and **YouTube** content **dynamically** based on **GitHub** Action.

Before you start, You need create a new **DIR**: **/.github/workflows**


### Add Latest Blog Posts {#add-latest-blog-posts}

you need create a new **yml** file, you can named **blog-post-workflow.yml**

```yml
name: Latest blog post workflow
on:
  schedule:
    # Runs every hour
    - cron: '0 * * * *'
  workflow_dispatch:

jobs:
  update-readme-with-blog:
    name: Update this repo's README with latest blog posts
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: gautamkrishnar/blog-post-workflow@master
        with:
          feed_list: "https://www.yanboyang.com/index.xml"
          max_post_count: 10
          date_format: "dd-mm-yyyy"
          template: "$newline - $date [$title]($url)"
```

**Importance Note**: You also need add following contents in your **README**.

```md
## Latest Blog Posts
<!-- BLOG-POST-LIST:START -->

<!-- BLOG-POST-LIST:END -->
```

You need change the **feed_list** with your owm **Blog**.

If you have NOT blog, I recommend read [Blog/Creating a Hugo blog]({{< relref "hugo" >}}).


### Add Latest github activity {#add-latest-github-activity}

You need create a new **yml** file, you can named **github-activity-workflow.yml**

```yml
name: Latest github post workflow
on:
  schedule:
    # Runs every hour
    - cron: '0 * * * *'
  workflow_dispatch:

jobs:
  update-readme-with-blog:
    name: Update this repo's README with latest blog posts
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: gautamkrishnar/blog-post-workflow@master
        with:
          feed_list: "https://github.com/yanboyang713"
          comment_tag_name: "GITHUB"
          max_post_count: 10
          accept_header: "application/atom+xml"
```

**Importance Note**: You also need add following contents in your **README**.

```md
## Latest Github Activity

<!-- GITHUB:START -->

<!-- GITHUB:END -->
```

You need change the **feed_list** with your owm **GitHub**.


### Add Top Followers {#add-top-followers}

You need create a new **yml** file, you can named **topFollowers.yml**.

```yml
name: Get Top Followers

on:
  push:
    branches:
      - master
  schedule:
    - cron: '0 22 * * *'
  workflow_dispatch:

jobs:
  top-followers:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup python
        uses: actions/setup-python@v2.2.2
        with:
          python-version: 3.8
      - name: Install requests
        run: pip install requests
      - name: Update README
        run: python src/topFollowers.py ${{ github.repository_owner }} ${{ secrets.GITHUB_TOKEN }} README.md
      - name: Commit changes
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add -A
          git diff-index --quiet HEAD || git commit -m "Update top followers"
      - name: Pull changes
        run: git pull -r
      - name: Push changes
        uses: ad-m/github-push-action@b007e7b818e33b04afd056e4c4b57ba917145d7a
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

**Importance Note**: You also need add following contents in your **README**.

```md
## Top Followers
<!--START_SECTION:top-followers-->

<!--END_SECTION:top-followers-->
```


### Add Starred {#add-starred}

You need create a new **yml** file, you can named **starred.yml**.

```yml
name: Update awesome-stars

on:
  schedule:
    - cron: 0 18 * * *
  workflow_dispatch:

jobs:
  awesome-stars:
    name: update awesome-stars
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2.2.2
        with:
          python-version: 3.8
      - run: pip install starred
      - name: Update star list
        run: starred --username ${{ github.repository_owner }} --sort --token ${{ secrets.GITHUB_TOKEN }} > AWESOME-STARS.md
      - name: Commit changes
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add -A
          git diff-index --quiet HEAD || git commit -m "Update awesome stars"
      - name: Pull changes
        run: git pull -r
      - name: Push changes
        uses: ad-m/github-push-action@b007e7b818e33b04afd056e4c4b57ba917145d7a
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

**Importance Note**: You also need add following contents in your **README**.

```md
## Github Stats

<table border="0">
 <tr>
<td class="d-inline">
  <td>
<img src="https://github-readme-stats.vercel.app/api?username=yanboyang713&count_private=true&show_icons=true" />

</td>

<td>
<img src="https://github-readme-stats.vercel.app/api/top-langs/?username=yanboyang713&layout=compact"/>

</td>

</table>
```

You need change the **username** with your owm **username**.


### Add Youtube {#add-youtube}

You need create a new **yml** file, you can named **youtube-workflow.yml**.

```yml
name: Latest YouTube Videos
on:
  schedule:
    # Runs every hour
    - cron: '0 * * * *'
  workflow_dispatch:

jobs:
  update-readme-with-youtube:
    name: Update this repo's README with latest videos from YouTube
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: gautamkrishnar/blog-post-workflow@master
        with:
          comment_tag_name: "YOUTUBE"
          feed_list: "https://www.youtube.com/feeds/videos.xml?channel_id=UCiGWcKBGD4UcH1VM0ZB2i0Q"
          max_post_count: 10
          date_format: "dd-mm-yyyy"
          template: "$newline - $date [$title]($url)"
```

**Importance Note**: You also need add following contents in your **README**.

```md
## Latest YouTube Videos
<!-- YOUTUBE:START -->

<!-- YOUTUBE:END -->
```

You need change the **channel_id** with your owm **channel_id**.


## Reference List {#reference-list}

1.  <https://towardsdatascience.com/build-a-stunning-readme-for-your-github-profile-9b80434fe5d7>
