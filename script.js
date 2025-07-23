// Reveal elements on scroll
const reveals = document.querySelectorAll('.reveal');

const options = {
  threshold: 0.1
};

const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('active');
      observer.unobserve(entry.target); // optional: stop observing after reveal
    }
  });
}, options);

reveals.forEach(reveal => {
  observer.observe(reveal);
});
