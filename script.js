const video = document.getElementById("myVideo");
const playPauseBtn = document.getElementById("playPause");
const playPauseIcon = document.getElementById("playPauseIcon");
const fullscreenBtn = document.getElementById("fullscreen");

const pauseIcon = "pause.svg";
const playIcon = "play.svg";

// Toggle play/pause
playPauseBtn.addEventListener("click", () => {
  const isPaused = video.paused;
  video[isPaused ? 'play' : 'pause']();
  playPauseIcon.src = isPaused ? pauseIcon : playIcon;
  playPauseBtn.blur();
});

// Toggle fullscreen
fullscreenBtn.addEventListener("click", () => {
  if (!document.fullscreenElement) {
    video.requestFullscreen();
  } else {
    document.exitFullscreen();
  }
  fullscreenBtn.blur();
});

// Fade-in on scroll
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll('.fade-out').forEach(el => observer.observe(el));

function copyCommand() {
  const command = document.getElementById("bashCommand").textContent;
  const icon = document.getElementById("copyIcon");

  navigator.clipboard.writeText(command).then(() => {
    icon.src = "check.svg"; // Show checkmark
    setTimeout(() => {
      icon.src = "copy.svg"; // Revert after 1.5s
    }, 1500);
  }).catch(err => {
    console.error("Copy failed:", err);
  });
}


