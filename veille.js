// Scroll-to-top button
const toTopBtn = document.createElement("button");
toTopBtn.innerText = "⬆️";
toTopBtn.id = "scrollTopBtn";
document.body.appendChild(toTopBtn);

toTopBtn.onclick = () => window.scrollTo({ top: 0, behavior: 'smooth' });

window.addEventListener("scroll", () => {
  toTopBtn.style.display = window.scrollY > 300 ? "block" : "none";
});

// Fade-in animation on scroll
const faders = document.querySelectorAll('.fade-in');
const appearOptions = {
  threshold: 0.2,
  rootMargin: "0px 0px -100px 0px"
};

const appearOnScroll = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (!entry.isIntersecting) return;
    entry.target.classList.add("appear");
    observer.unobserve(entry.target);
  });
}, appearOptions);

faders.forEach(fader => appearOnScroll.observe(fader));
