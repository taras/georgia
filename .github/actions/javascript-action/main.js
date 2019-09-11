//const core = require('@actions/core');

async function run() {
  try {
    // const nameInput = core.getInput('name');
    // console.log(`Hello ${nameInput}!`);
    console.log('hello')
  } catch (error) {
    //core.setFailed(error.message);
    console.log('error')
  }
}

run();