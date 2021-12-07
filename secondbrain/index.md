# Building a Second Brain: Capturing, Organizing, and Sharing Knowledge for Scholars and Researchers


## Introduction {#introduction}

Building a Second Brain is about creating a reliable system – outside your physical skin-and-bone bodily boundaries – for storing, organising, digesting, and eventually transforming information into Good Creative Output.

Much like any well-integrated tool, I am currently using **Emacs Org Mode** as Second Brain **core** tool. This system also includes many other peripheral components that make up the complete **Second Brain** system.

I will follow the below overview diagram introducte each components one by one.

{{< mermaid >}}flowchart LR;
    A[Zotero \n\n Plugins: \n - Better BibTex \n - ZotFile \n - Scite (optional)] -->|.bib file| B[org-roam-bibtex \n - Create org file for each bib entry \n - Templating \n - orb-pdf-scrapper*]
    B --> |Add-ons: \n - org-noter \n - PDF-tools| R[org-roam \n - Build database \n - Make connections \n - Visualize database]
    B --> |Add-ons: \n - org-noter \n - PDF-tools| O[org-mode \n - Write \n - Assign tasks \n - Run code \n - orgtransclusion \n - Export]
    R --> O
{{< /mermaid >}}

