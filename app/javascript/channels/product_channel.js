import consumer from "./consumer"

const initProductChannel = () => {
  const ul = document.getElementById('bids');

  if(ul){
    const productId = ul.dataset['productId'];
    subscription(productId)
  }
}

const subscription = (productId) => {
  consumer.subscriptions.create({ channel: "ProductChannel", id: productId }, {
    received(data) {
      addBid(data.bidHTML);
      updateCurrentPrice(data.productPrice);
      console.log('data received');
    },
    connected() {
      console.log('connected');
    },

  });
}

const addBid = (bidHTML) => {
  const ul = document.getElementById('bids');
  ul.insertAdjacentHTML('afterbegin', bidHTML);
}

const updateCurrentPrice = (productPrice) => {
  const currentPrice = document.getElementById('current-price');
  currentPrice.textContent = productPrice;
}

export { initProductChannel }