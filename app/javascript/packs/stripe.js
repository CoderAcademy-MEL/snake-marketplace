<<<<<<< HEAD
import '@stripe/stripe-js';

const button = document.getElementById("stripe")
button.addEventListener("click", (e) => {
  const id = location.pathname.split("/")[2]
  fetch(`/payments/session?id=${id}`)
  .then((res) => res.json())
  .then((data) => {
    const stripe = Stripe(data.stripe_public_key);
    stripe.redirectToCheckout({
      sessionId: data.id
    })
  })
})
=======
 // ill quickly run though what this file is doing but today isn't a js lesson
 import '@stripe/stripe-js';

 const button = document.getElementById("stripe")
 button.addEventListener("click", (e) => {
   const id = location.pathname.split("/")[2]
  // making a GET request through javascript   
   fetch(`/payments/session?id=${id}`)
   .then((res) => res.json())
   .then((data) => {
     const stripe = Stripe(data.stripe_public_key);
     stripe.redirectToCheckout({
       sessionId: data.id
     })
   })
 })
>>>>>>> 9c62899a82ec48e2c360002abd10d02d87e9d093
