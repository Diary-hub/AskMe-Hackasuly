const userSignUp = async () => {
    const signUpEmail = userEmail.value;
    const signUpPassword = userPassword.value;
    createUserWithEmailAndPassword(auth, signUpEmail, signUpPassword)
      .then((userCredential) => {
        const user = userCredential.user;
        console.log(user);
        alert("Your account has been created!");
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        console.log(errorCode + errorMessage);
      });
  };

  const userSignIn = async () => {
    const signInEmail = userEmail.value;
    const signInPassword = userPassword.value;
    signInWithEmailAndPassword(auth, signInEmail, signInPassword)
      .then((userCredential) => {
        const user = userCredential.user;
        alert("You have signed in successfully!");
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        console.log(errorCode + errorMessage);
      });
  };

  const checkAuthState = async () => {
    onAuthStateChanged(auth, (user) => {
      if (user) {
        console.log(user);
      } else {
        console.log("not User");
      }
    });
  };

  const userSignOut = async () => {
    await signOut(auth);
  };

  checkAuthState();