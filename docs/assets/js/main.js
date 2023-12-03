window.onload = function() {
  // var granimInstance = new Granim({
  //   element: "#canvas-complex",
  //   direction: "top-bottom",
  //   isPausedWhenNotInView: true,
  //   image: {
  //     source: "assets/images/commitfusion-banner-bg.jpg",
  //     blendingMode: "multiply",
  //   },
  //   states: {
  //     "default-state": {
  //       gradients: [
  //         ["#29323c", "#485563"],
  //         ["#FF6B6B", "#556270"],
  //         ["#80d3fe", "#7ea0c4"],
  //         ["#f0ab51", "#eceba3"],
  //       ],
  //       transitionSpeed: 7000,
  //     },
  //   },
  // });

  // Development 
  var development = false

  // Get all details elements
  const detailsElements = document.querySelectorAll(".accordion details");
  let typed1;
  let typed2;
  let typed3;
  let typed4;  
  // let typed7;
  // let typed8;

  // detailsElements.foreach((detailsElement) => { detailsElement.SetAttribute("open", "false")});
  detailsElements.forEach((detailsElement) => {
    detailsElement.addEventListener("click", (event) => {
      console.log(event);
      event.preventDefault();
      console.log(detailsElement);
      // // ----------------- set-commit-----------------------------------
      // if (detailsElement !== detailsElement){
      //   detailsElement.removeAttribute("open");
      // }
        if (!detailsElement.hasAttribute("open")) {
          detailsElement.setAttribute("open", "");

          /**
           ** Set-Commit Typed Text
           */
          var new_commitMinimal =
            '<span class="c"># Generate a new feature commit message with the minimum required parameters.</span></br>';
          new_commitMinimal +=
            '^1000 <span>pwsh></span> <span class="n">New-Commit</span> <span class="nt">-Type</span> feat </br></br>';
          new_commitMinimal += "`✨ feat: Adding New Features </br>`";
          new_commitMinimal += "` ... `^5000";

          var new_commitFeature =
            '<span class="c"># Generate a new feature commit message with Feature Additions.</span></br>';
          new_commitFeature +=
            '^1000 <span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">-Type</span> feat <span class="nt">-Scope</span> "add" <span class="nt">-Description</span> "Adding New Features" <span class="nt">-FeatureAdditions</span> "Feature 1", "Feature 2"</br></br>';
          new_commitFeature +=
            "`✨ feat(Addition): Adding New Features</br></br>🌟 FEATURE ADDTIONS:</br></br>🍠 Feature 1</br></br>🍠 Feature 2 ..🖊`</br></br>";
          new_commitFeature += "` ... `^5000 ";

          var new_commitbugfix =
            '<span class="c"># Generate a new bugfix commit message with some notes.</span></br>';
          new_commitbugfix +=
            '^1000 <span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">-Type</span> fix <span class="nt">-Scope</span> "#256" <span class="nt">-Notes</span> "fixed #256","fixed #212"</br></br>';
          new_commitbugfix +=
            "`🐛 fix(#256): Fixed bugs. </br></br>🧰 Build: patch </br></br>📜 NOTES: </br>✏  Fixed #82  </br>✏  fixed #21</br></br>";
          new_commitbugfix += "` ... ^5000 ";

          var new_commitend =
            '<span class="c"># Commitfusion provides a number of Parameters to allow a full customizable commit message. </span></br>';
          /**
           ** Set-Commit Typed Text
           */
          var set_commit =
            '<span class="c"># Apply the commit by using "Set-Commit", set-commit simply runs git commit $commitfusionmessage"</span></br>';
          set_commit +=
            '<span class="c"># You can run Set-commit -Test to test commit</span>';
          set_commit +=
            '^1000 </br><span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">@param</span> | <span class="n">Set-Commit</span> <span class="nt">-Confirm</span></br></br>';
          set_commit += "`Git Commit cli output...";
          set_commit += "` ^5000 ";
          /**
           ** Get-CommitTypes Typed Text
           */
          var get_committypes =
            '<span class="c"># Get all supported commit types, found in $moduleroot/libs/commitfusion.types.json.</span></br>';
          get_committypes +=
            '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span></br></br>';
          get_committypes += "^200 `";
          get_committypes += `
  Type         description                                                  semver cfa          emoji
  ----         -----------                                                  ------ ---          -----
  changes      Introduce breaking changes.                                  major  {@{action=}} 💥
  feat         Introduce new features.                                      minor  {@{action=}} ✨
  fix          Fixed bugs.                                                  patch  {@{action=}} 🐛
  docs         Update Documentation.                                               {@{action=}} 📝
  style        Update style.                                                patch  {@{action=}} 💄
  perf         Improve performance.                                         patch  {@{action=}} ⚡️
  test         Add tests.                                                          {@{action=}} ✅
  build        Build.                                                       patch  {@{action=}} 📦
  ci           Add / Update Continuous integration.                                {@{action=}} 👷
  chore        Add / Update Tooling, Generic commit                                {@{action=}} 🔧
  revert       Revert changes to previous commit                            patch  {@{action=}} ⏪
  bookmark     Release / Version tags.                                             {@{action=}} 🔖
  wip          Work in progress.                                                   {@{action=}} 🚧
  gitignore    Add / Update a .gitignore file.                                     {@{action=}} 🙈
  gitsubmodule Add / Update git submodules                                         {@{action=}} 🧮
  flag         Add, update, or remove feature flags.                               {@{action=}} 🚩
  improve      Improve structure / format of the code.                      patch  {@{action=}} 🎨
  hotfix       Critical hotfix.                                             patch  {@{action=}} 🚑️
  deploy       Deploy stuff.                                                       {@{action=}} 🚀
  project      Begin a project.                                                    {@{action=}} 🎉
  security     Fix security issues.                                         patch  {@{action=}} 🔒️
  refactor     Refactor code.                                                      {@{action=}} ♻️
  depadd       Add a dependency.                                            patch  {@{action=}} ➕
  depdell      Remove a dependency.                                         patch  {@{action=}} ➖
  config       Add or update configuration files.                           patch  {@{action=}} 🔧
  typos        Fix typos.                                                   patch  {@{action=}} ✏️
  resources    Move or rename resources (e.g.: files, paths, routes).              {@{action=}} 🚚
  fix-s        Simple fix for a non-critical issue.                         patch  {@{action=}} 🩹
  deadcode     Remove dead code.                                                   {@{action=}} ⚰️
  Depre        Remove deprecate code.                                              {@{action=}} 🗑️
  concurrency  Add or update code related to multithreading or concurrency.        {@{action=}} 🧵
  Infra        Infrastructure related changes.                              patch  {@{action=}} 🧱
  compiler     Fix compiler / linter warnings.                                     {@{action=}} 🚨
  cifix        Fix CI Build.                                                       {@{action=}} 💚
  depdown      Downgrade dependencies.                                      patch  {@{action=}} ⬇️
  depup        Upgrade dependencies.                                        patch  {@{action=}} ⬆️
  depfix       Pin dependencies to specific versions.                       patch  {@{action=}} 📌
  globloc      Internationalization and localization.                       patch  {@{action=}} 🌐
  `;
          get_committypes += "` ... ^5000 ";

          /**
           ** Get-CommitTypes -Minor Typed Text
           */
          var get_committypes_minor =
            '<span class="c"># Get commit types with semver value of patch parameters -Minor</span></br>';
          get_committypes_minor +=
            '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span><span class="nt"> -Minor</span></br></br>';
          get_committypes_minor += "^200 `";
          get_committypes_minor += `
  Type        description                                                  semver cfa          emoji
  ----        -----------                                                  ------ ---          -----
  feat        Introduce new features.                                      minor  {@{action=}} ✨
  `;
          get_committypes_minor += "` ... ^5000 ";

          /**
           ** Get-CommitTypes -Patch Typed Text
           */
          var get_committypes_patch =
            '<span class="c"># Get commit types with semver value of minor parameters -Patch</span></br>';
          get_committypes_patch +=
            '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span><span class="nt"> -Minor</span></br></br>';
          get_committypes_patch += "^200 `";
          get_committypes_patch += `
  type     description                             semver cfa          emoji
  ----     -----------                             ------ ---          -----
  fix      Fixed bugs.                             patch  {@{action=}} 🐛
  style    Update style.                           patch  {@{action=}} 💄
  perf     Improve performance.                    patch  {@{action=}} ⚡️
  build    Build.                                  patch  {@{action=}} 📦
  revert   Revert changes to previous commit       patch  {@{action=}} ⏪
  improve  Improve structure / format of the code. patch  {@{action=}} 🎨
  hotfix   Critical hotfix.                        patch  {@{action=}} 🚑️
  security Fix security issues.                    patch  {@{action=}} 🔒️
  depadd   Add a dependency.                       patch  {@{action=}} ➕
  depdell  Remove a dependency.                    patch  {@{action=}} ➖
  config   Add or update configuration files.      patch  {@{action=}} 🔧
  typos    Fix typos.                              patch  {@{action=}} ✏️
  fix-s    Simple fix for a non-critical issue.    patch  {@{action=}} 🩹
  Infra    Infrastructure related changes.         patch  {@{action=}} 🧱
  depdown  Downgrade dependencies.                 patch  {@{action=}} ⬇️
  depup    Upgrade dependencies.                   patch  {@{action=}} ⬆️
  depfix   Pin dependencies to specific versions.  patch  {@{action=}} 📌
  globloc  Internationalization and localization.  patch  {@{action=}} 🌐
  `;
          get_committypes_patch += "` ... ^5000 ";

          /**
           ** Get-CommitTypes -Patch Typed Text
           */
          var get_committypes_Major =
            '<span class="c"># Get commit types with semver value of minor parameters -Major</span></br>';
          get_committypes_Major +=
            '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span><span class="nt"> -Major</span></br></br>';
          get_committypes_Major += "^200 `";
          get_committypes_Major += `
  Type    description                 semver cfs emoji
  ----    -----------                 ------ --- -----
  changes Introduce breaking changes. major      💥
  `;
          get_committypes_Major += "` ... ^5000 ";

          var format_fusion_md =
            '<span class="c"> # Format commit string in markdown for change log update </span></br>';
          format_fusion_md +=
            '<span class="c"> # This can be pipped into Update-Changelog to write to changelog file </span></br>';
          format_fusion_md +=
            '^1000 <span>pwsh> </span> <span class="n">New-Commit</span> <span class="nt">-type</span> feat | <span class="n">Format-FusionMD</span></br></br>';
          format_fusion_md +=
            "`## 🎯-✨ feat: Introduce new features. </br></br> > [🧰]» <kbd>MINOR</kbd></br>";
          format_fusion_md += "` ... ^5000 ";

          switch (detailsElement.id) {
            case "newcommit_wrapper": {
              if (typed1 !== undefined) {
                typed1.destroy();
                console.log("destroyed");
              }
              typed1 = new Typed("#newcommit", {
                strings: [
                  new_commitMinimal,
                  new_commitFeature,
                  new_commitbugfix,
                  new_commitend,
                ],
                typeSpeed: 10,
                fadeOut: true,
                backSpeed: 0,
                loop: true,
              });
            }
            case "setcommit_wrapper": {
              if (typed2 !== undefined) {
                typed2.destroy();
                console.log("destroyed");
              }
              typed2 = new Typed("#setcommit", {
                strings: [set_commit],
                typeSpeed: 10,
                fadeOut: true,
                backSpeed: 0,
                loop: true,
              });
            }
            case "getcommittypes_wrapper": {
              if (typed3 !== undefined) {
                typed3.destroy();
                console.log("destroyed");
              }
              typed3 = new Typed("#getcommittypes", {
                strings: [
                  get_committypes,
                  get_committypes_patch,
                  get_committypes_minor,
                  get_committypes_Major,
                ],
                typeSpeed: 10,
                fadeOut: true,
                backSpeed: 0,
                loop: true,
              });
            }
            case "formatfusionmd_wrapper": {
              if (typed4 !== undefined) {
                typed4.destroy();
                console.log("destroyed");
              }
              typed4 = new Typed("#formatfusionmd", {
                strings: [format_fusion_md],
                typeSpeed: 10,
                fadeOut: true,
                backSpeed: 0,
                loop: true,
              });
            }
          }
        } else {
          switch (detailsElement.id) {
            case "newcommit_wrapper": { detailsElement.removeAttribute("open");typed1.destroy();}
            case "setcommit_wrapper": {  detailsElement.removeAttribute("open");typed2.destroy();}
            case "getcommittypes_wrapper": { detailsElement.removeAttribute("open");typed3.destroy();}
            case "formatfusionmd_wrapper": { detailsElement.removeAttribute("open");typed4.destroy();}
          }
          console.log("close");
        }

      // if (!detailsElement.hasAttribute("open")) {
      //   detailsElement.setAttribute("open", "");
      //   var set_commit =
      //     '<span class="c"># Apply the commit by using "Set-Commit"</span>';
      //   set_commit +=
      //     '^1000 </br><span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">@param</span> | <span class="n">Set-Commit</span></br></br>';
      //   set_commit += "`Git Commit cli output...";
      //   set_commit += "` ^5000 `";
      //   typed_newcommit_instance = new Typed("#setcommit", {
      //     strings: [set_commit],
      //     typeSpeed: 10,
      //     fadeOut: true,
      //     backSpeed: 0,
      //     loop: true,
      //   });
      // } else {
      //   typed_newcommit_instance.destroy();
      //   detailsElement.removeAttribute("open");
      //   console.log("close");
      // }

      // // ----------------- new-commit-----------------------------------
      // if (!detailsElement.hasAttribute("open")) {
      //   detailsElement.setAttribute("open", "");
      //   var ConventionalCommitTypedMinimal =
      //     '<span class="c"> # Generate a new feature commit message with the minimum required parameters</span></br>';
      //   ConventionalCommitTypedMinimal +=
      //     '^1000 <span>pwsh></span> <span class="n">New-Commit</span> <span class="nt">-Type</span> feat <span class="nt">-Description</span> "Adding <b>New</b> Features" </br></br>';
      //   ConventionalCommitTypedMinimal +=
      //     "`✨ feat: Adding New Features </br>`";
      //   ConventionalCommitTypedMinimal +=
      //     "^5000";

      //   var ConventionalCommitTypedFeature =
      //     '<span class="c"> # Generate a new feature commit message with Feature Additions</span></br>';
      //   ConventionalCommitTypedFeature +=
      //     '^1000 <span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">-Type</span> feat <span class="nt">-Scope</span> "add" <span class="nt">-Description</span> "Adding New Features" -FeatureAdditions "Feature 1", "Feature 2"</br></br>';
      //   ConventionalCommitTypedFeature +=
      //     "^200 `✨ feat(Addition): Adding New Features</br></br>🌟 FEATURE ADDTIONS:</br></br>🍠 Feature 1</br></br>🍠 Feature 2 ..🖊`";
      //   ConventionalCommitTypedFeature +=
      //     '^1000 </br></br><span class="c"># Happy with the commit message apply commit message, Apply it</span>';
      //   ConventionalCommitTypedFeature +=
      //     '^1000 </br><span>pwsh> </span><span class="n">New-Commit</span> <span class="nt">-Type</span> feat <span class="nt">-Scope</span> "add" <span class="nt">-Description</span> "Adding New Features" | <span class="n">Set-Commit</span></br></br>';
      //   ConventionalCommitTypedFeature += "^100 Git Commit cli output...";
      //   ConventionalCommitTypedFeature += "^5000";
      //   typed_newcommit = new Typed("#newcommit", {
      //     strings: [

      //     ],
      //     typeSpeed: 10,
      //     fadeOut: true,
      //     backSpeed: 0,
      //     loop: true,
      //   });
      // } else {
      //   typed_newcommit.destroy();
      //   detailsElement.removeAttribute("open");
      //   console.log("close");
      // }

      // // ----------------- get-committypes-----------------------------------
      // if (!detailsElement.hasAttribute("open")) {
      //   var get_committypesall =
      //     '<span class="c"> # Get all supported commit types</span></br>';
      //   get_committypesall +=
      //     '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span></br></br>';
      //   get_committypesall +=
      //     "^200 `";
      //   get_committypesall += `
      //   Type        description                                                  semver cfa          emoji
      //   ----        -----------                                                  ------ ---          -----
      //   changes     Introduce breaking changes.                                  major  {@{action=}} 💥
      //   feat        Introduce new features.                                      minor  {@{action=}} ✨
      //   fix         Fixed bugs.                                                  patch  {@{action=}} 🐛
      //   docs        Update Documentation.                                               {@{action=}} 📝
      //   style       Update style.                                                patch  {@{action=}} 💄
      //   perf        Improve performance.                                         patch  {@{action=}} ⚡️
      //   test        Add tests.                                                          {@{action=}} ✅
      //   build       Build.                                                       patch  {@{action=}} 📦
      //   ci          Continuous integration.                                             {@{action=}} 👷
      //   chore       Tooling, Generic commit                                             {@{action=}} 🔧
      //   revert      Revert changes.                                              patch  {@{action=}} ⏪
      //   bookmark    Release / Version tags.                                             {@{action=}} 🔖
      //   wip         Work in progress.                                                   {@{action=}} 🚧
      //   gitignore   Add or update a .gitignore file.                                    {@{action=}} 🙈
      //   flag        Add, update, or remove feature flags.                               {@{action=}} 🚩
      //   improve     Improve structure / format of the code.                      patch  {@{action=}} 🎨
      //   hotfix      Critical hotfix.                                             patch  {@{action=}} 🚑️
      //   deploy      Deploy stuff.                                                       {@{action=}} 🚀
      //   project     Begin a project.                                                    {@{action=}} 🎉
      //   security    Fix security issues.                                         patch  {@{action=}} 🔒️
      //   refactor    Refactor code.                                                      {@{action=}} ♻️
      //   depadd      Add a dependency.                                            patch  {@{action=}} ➕
      //   depdell     Remove a dependency.                                         patch  {@{action=}} ➖
      //   config      Add or update configuration files.                           patch  {@{action=}} 🔧
      //   typos       Fix typos.                                                   patch  {@{action=}} ✏️
      //   resources   Move or rename resources (e.g.: files, paths, routes).              {@{action=}} 🚚
      //   fix-s       Simple fix for a non-critical issue.                         patch  {@{action=}} 🩹
      //   deadcode    Remove dead code.                                                   {@{action=}} ⚰️
      //   Depre       Remove deprecate code.                                              {@{action=}} 🗑️
      //   concurrency Add or update code related to multithreading or concurrency.        {@{action=}} 🧵
      //   Infra       Infrastructure related changes.                              patch  {@{action=}} 🧱
      //       `;
      //   get_committypesall += "` ^5000 `";

      //   var get_committypes_minor =
      //     '<span class="c"> # Get commit types with semver value of minor parametters -Minor -Major -Patch -NoSemVer</span></br>';
      //   get_committypes_minor +=
      //     '^1000 <span>pwsh> </span> <span class="n">Get-CommitTypes</span><span class="nt"> -Minor</span></br></br>';
      //   get_committypes_minor +=
      //     "^200 `";
      //   get_committypes_minor += `
      //   Type        description                                                  semver cfa          emoji
      //   ----        -----------                                                  ------ ---          -----
      //   feat        Introduce new features.                                      minor  {@{action=}} ✨
      //   `;
      //   get_committypes_minor +=
      //     "` ^5000 `";
      //   typed7 = new Typed("#getcommittypes", {
      //     strings: [get_committypesall, get_committypes_minor],
      //     typeSpeed: 10,
      //     fadeOut: true,
      //     backSpeed: 0,
      //     loop: true,
      //   });
      //   console.log("open");
      // } else {
      //   console.log("close");
      //   typed7.destroy();
      // }

      // if (!detailsElement.hasAttribute("open")) {
      //   var format_fusion_md =
      //       '<span class="c"> # Format commit string in markdown for change log update </span></br>';
      //     format_fusion_md +=
      //       '<span class="c"> # This can be pipped into Update-Changelog to write to changelog file </span></br>';
      //     format_fusion_md +=
      //       '^1000 <span>pwsh> </span> <span class="n">New-Commit</span> <span class="nt">-type</span>  | <span class="n">Update-Changelog</span></br></br>';
      //     format_fusion_md += ' ^5000 ';
      //     typed5 = new Typed("#formatfusionmd", {
      //     strings: [format_fusion_md],
      //     typeSpeed: 10,
      //     fadeOut: true,
      //     backSpeed: 0,
      //     loop: true,
      //   });
      //   console.log("open");
      // } else {
      //   console.log("close");
      //   typed5.destroy();
      // }
    });
  });

  var menu = document.getElementById("menu");
  if (menu && development === true) {
    switch (document.location.pathname) {
      case "/":
        console.log("Nav to Index");
        document.getElementById("about").classList.add("button-page-active");
        break;

      case "/features":
        console.log("Nav to features");
        document.getElementById("features").classList.add("button-page-active");
        break;

      case "/install":
        console.log("Nav to Installation");
        document
          .getElementById("installation")
          .classList.add("button-page-active");
        break;

      case "/cmdlets":
        console.log("Nav to cmdlets");
        document.getElementById("cmdlets").classList.add("button-page-active");
        break;

      case "/examples":
        console.log("Nav to examples");
        document.getElementById("examples").classList.add("button-page-active");
        break;

      default:
        console.log("Nav to features");
    }
  }
  else{
    switch (document.location.pathname) {
      case "/":
        console.log("Nav to Index");
        document.getElementById("about").classList.add("button-page-active");
        break;

      case "/features":
        console.log("Nav to features");
        document.getElementById("features").classList.add("button-page-active");
        break;

      case "/install":
        console.log("Nav to Installation");
        document
          .getElementById("install")
          .classList.add("button-page-active");
        break;

      case "/cmdlets":
        console.log("Nav to cmdlets");
        document.getElementById("cmdlets").classList.add("button-page-active");
        break;

      case "/examples":
        console.log("Nav to examples");
        document.getElementById("examples").classList.add("button-page-active");
        break;

      default:
        console.log("Nav to features");
    }
  }
} 


  // var granimInstance = new Granim({
  //   element: "#canvas-complex",
  //   direction: "left-right",
  //   isPausedWhenNotInView: true,
  //   states: {
  //     "default-state": {
  //       gradients: [
  //         [
  //           { color: "#833ab4", pos: 0.2 },
  //           { color: "#fd1d1d", pos: 0.8 },
  //           { color: "#38ef7d", pos: 1 },
  //         ],
  //         [
  //           { color: "#40e0d0", pos: 0 },
  //           { color: "#ff8c00", pos: 0.2 },
  //           { color: "#ff0080", pos: 0.75 },
  //         ],
  //       ],
  //     },
  //   },
  // });

