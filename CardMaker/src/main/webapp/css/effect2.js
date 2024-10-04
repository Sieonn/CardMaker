document.addEventListener('DOMContentLoaded', () => {
    var cards = document.querySelectorAll('.card');

    cards.forEach(card => {
        var shine = card.querySelector('.shine');
        var overlay = card.querySelector('.overlay');

        card.addEventListener('mousemove', (e) => {
            var rect = card.getBoundingClientRect();
            var x = e.clientX - rect.left;
            var y = e.clientY - rect.top;
            var rotateY = -1 / 10 * x + 20;
            var rotateX = 4 / 40 * y - 20;
            card.style.transform = `perspective(300px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;

            // radial-gradient를 사용하여 마우스 위치에 따라 shine 효과 조정
            shine.style.background = `radial-gradient(circle at ${x}px ${y}px, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1) 30%, transparent 60%)`;
            // overlay 효과 조정
            overlay.style.opacity = `${0.5 + x / rect.width / 2}`;
        });

        card.addEventListener('mouseout', () => {
            card.style.transform = 'rotateX(0deg) rotateY(0deg)';
            shine.style.background = 'none';
            overlay.style.opacity = '0';
        });
    });
});