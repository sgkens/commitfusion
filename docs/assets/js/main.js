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


  if (document.getElementById("typed-cf")) {

      var ConventionalCommitTypedMinimal =
        '<span class="c"> # Generate a new feature commit message with the minimum required parameters</span></br>';
      ConventionalCommitTypedMinimal +=
        '^1000 <span>pwsh></span> <span class="n">New-ConvenstionalCommit</span> <span class="nt">-Type</span> feat <span class="nt">-Description</span> "Adding <b>New</b> Features" </br></br>';
      ConventionalCommitTypedMinimal += 
        "^200 `✨ feat: Adding New Features`";
      ConventionalCommitTypedMinimal +=
        '^5000 </br></br><span class="c"># Apply the commit by using "Set-Commit"</span>';
      ConventionalCommitTypedMinimal +=
        '^1000 </br><span class="n">New-ConvenstionalCommit</span> <span class="nt">-Type</span> feat <span class="nt">-Description</span> "Adding <b>New</b> Features" | <span class="n">Set-Commit</span></br></br>';
      ConventionalCommitTypedMinimal +=
        "^100Git Commit cli output..."
      ConventionalCommitTypedMinimal +=
        "^5000";

      var ConventionalCommitTypedFeature =
        '<span class="c"> # Generate a new feature commit message with Feature Addtions</span></br>';
      ConventionalCommitTypedFeature +=
        '^1000 <span>pwsh></span> <span class="n">New-ConvenstionalCommit</span> <span class="nt">-Type</span> feat <span class="nt">-Scope</span> "add" <span class="nt">-Description</span> "Adding New Features" -FeatureAdditions "Feature 1", "Feature 2"</br></br>';
      ConventionalCommitTypedFeature +=
        "^200 `✨ feat(Addition): Adding New Features</br></br>🌟 FEATURE ADDTIONS:</br></br>🍠 Feature 1</br></br>🍠 Feature 2 ..🖊`";
      ConventionalCommitTypedFeature +=
        '^1000 </br></br><span class="c"># Happy with the commit message apply commit message, Apply it</span>';
      ConventionalCommitTypedFeature +=
        '^1000 </br><span class="n">New-ConvenstionalCommit</span> <span class="nt">-Type</span> feat <span class="nt">-Scope</span> "add" <span class="nt">-Description</span> "Adding New Features" | <span class="n">Set-Commit</span></br></br>';
      ConventionalCommitTypedFeature += 
        "^5000";

    var typed6 = new Typed("#typed-cf", {
      strings: [ConventionalCommitTypedMinimal, ConventionalCommitTypedFeature],
      typeSpeed: 10,
      fadeOut: true,
      backSpeed: 0,
      loop: true,
    });
  }

  // Menu Handler
  var menu = document.getElementById("menu");
  if (menu) {
    switch (document.location.pathname) {
      case "/":
        console.log("Nav to Index");
        document.getElementById("about").classList.add("button-page-active");
        break;

      case "/features":
        console.log("Nav to features");
        document.getElementById("features").classList.add("button-page-active");
        break;

      case "/installation":
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