function revealOnScroll() {
  const reveals = document.querySelectorAll('.reveal, [class*="container mx-auto px-6"]');
  for (const el of reveals) {
    const windowHeight = window.innerHeight;
    const elementTop = el.getBoundingClientRect().top;
    const elementVisible = 80;
    if (elementTop < windowHeight - elementVisible) {
      el.classList.add('active');
    } else {
      el.classList.remove('active');
    }
  }
}
window.addEventListener('scroll', revealOnScroll);
window.addEventListener('DOMContentLoaded', revealOnScroll);
