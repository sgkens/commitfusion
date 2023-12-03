---
layout: default
sitemap: true
---

# <i class="fa-solid fa-circle-info" style="color: #d07712;"></i> Overview
---

*CommitFusion* is a **PowerShell** module designed to streamline the process of generating *Conventional Commits Messages* in `git` for your Git repository. Commit Messages follows the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard, and uses [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see [🧷gitmoji.dev](https://gitmoji.dev), The module allows the construction of a custimized commit message with a number of options, and also offers a number of other features to streamline the process of generating a commit message, updating the changelog, generating **semver** version revisions, parsing gitmoji icons, and unicode emojis.


## *CMDLET Illustrations*

<div class="accordion">
   <details id="newcommit_wrapper">
     <summary><strong>New-Commit</strong></summary>
     <p> New-Commit is the main cmdlet used to generate a commit message. It accepts parameters for the Type, Scope, Description and optional Body content like Notes, FeatureAdditions etc. The message is formatted using the gitmoji schema.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="newcommit"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="setcommit_wrapper">
     <summary><strong>Set-Commit</strong></summary>
     <p> Set-Commit is used to update the commit message for the current branch.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="setcommit"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="getcommittypes_wrapper">
     <summary><strong>Get-CommitTypes</strong></summary>
     <p>Get-CommitTypes returns the supported commit types that can be used with New-Commit and Set-Commit. It returns the types as objects with properties like Name, Emoji, Description etc.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="getcommittypes"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="formatfusionmd_wrapper">
     <summary><strong>Format-FusionMD</strong></summary>
     <p> Format-FusionMD is used to generate a markdown file with the changelog for the current branch.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="formatfusionmd"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
  </div>
