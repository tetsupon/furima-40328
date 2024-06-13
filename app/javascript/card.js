let payjp;

const pay = () => {
  const publicKey = gon.public_key;
  if (!payjp) {
    payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  }
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');
  
  // IDを持つdivにエレメントをマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // フォームの送信イベントをハンドル
  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    
    
    payjp.createToken(numberElement).then(function(response) {
      if (response.error) {
        // エラーがあれば何もせず終了
      } else {
        const token = response.id;
        // フォームにトークンを追加して送信
        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'buyer_form[token]');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);
        form.submit(); // フォームを送信
        e.preventDefault(); // フォームのデフォルト送信を防ぐ
      }
    });
  });
};

// ページ読み込み時にpay関数を実行
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
