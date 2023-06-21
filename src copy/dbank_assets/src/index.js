import { dbank } from '../../declarations/dbank';

var splashScreen = document.getElementById('splashscreen');
var atmScreen = document.querySelector('.container');

// atmScreen.style.opacity = 0;

atmScreen.style.display = 'none';

window.addEventListener('load', async function () {
  // console.log("Finished loading");
  update();
});

document
  .querySelector('form')
  .addEventListener('submit', async function (event) {
    event.preventDefault();
    // console.log("Submitted.");

    const button = event.target.querySelector('#submit-btn');

    const inputAmount = parseFloat(
      document.getElementById('input-amount').value
    );
    const outputAmount = parseFloat(
      document.getElementById('withdrawal-amount').value
    );

    button.setAttribute('disabled', true);

    if (document.getElementById('input-amount').value.length != 0) {
      await dbank.topUp(inputAmount);
    }

    if (document.getElementById('withdrawal-amount').value.length != 0) {
      await dbank.withdraw(outputAmount);
    }

    await dbank.compound();

    update();

    document.getElementById('input-amount').value = '';
    document.getElementById('withdrawal-amount').value = '';

    button.removeAttribute('disabled');
  });

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById('value').innerText =
    Math.round(currentAmount * 100) / 100;
}

splashScreen.addEventListener('click', () => {
  splashScreen.style.opacity = 0;
  setTimeout(() => {
    splashScreen.style.display = 'none';
    atmScreen.style.display = 'block';
  }, 500);
});
