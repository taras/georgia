import * as core from '@actions/core';

async function run() {
  try {
    const nameInput = core.getInput('name');
    console.log(`Hello ${nameInput}!`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();