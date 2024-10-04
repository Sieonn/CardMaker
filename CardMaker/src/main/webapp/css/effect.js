
document.addEventListener('DOMContentLoaded', () => {
    // 기존 코드
    const container = document.querySelector('.container');
    const imageContainer = document.querySelector('.image-container');

    container.addEventListener('mousemove', function (e) {
        const rect = container.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const rotateY = ((x - centerX) / centerX) * 20; // -20도에서 20도까지 회전
        const rotateX = -((y - centerY) / centerY) * 20; // -20도에서 20도까지 회전

        imageContainer.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
    });

    container.addEventListener('mouseout', function () {
        imageContainer.style.transform = 'rotateX(0deg) rotateY(0deg)';
    });
});

var container = document.querySelector('.container');
var shine = document.querySelector('.shine');

container.addEventListener('mousemove', function (e) {
    var rect = container.getBoundingClientRect();
    var x = e.clientX - rect.left;
    var y = e.clientY - rect.top;
    var rotateY = -1 / 10 * x + 20;
    var rotateX = 4 / 40 * y - 20;

    shine.style.background = `radial-gradient(circle at ${x}px ${y}px, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1) 30%, transparent 60%)`;
    container.style.transform = `perspective(350px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
});

container.addEventListener('mouseout', function () {
    shine.style.background = 'none';
    container.style.transform = 'perspective(350px) rotateX(0deg) rotateY(0deg)';
});