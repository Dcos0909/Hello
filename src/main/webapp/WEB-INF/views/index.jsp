<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Ritika | Java Full Stack Developer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Professional portfolio of Ritika, Java Full Stack Developer">
    
    <!-- Favicon -->
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <meta name="theme-color" content="#4e54c8">

    <!-- Bootstrap 5 with dark mode support -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-dark-5@1.1.3/dist/css/bootstrap-dark.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4e54c8;
            --secondary-color: #8f94fb;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --transition-time: 0.4s;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: #333;
            transition: all var(--transition-time) ease;
            overflow-x: hidden;
        }
        
        .dark-mode {
            background-color: var(--dark-color);
            color: var(--light-color);
        }
        
        /* Animated cursor effect */
        .typed-cursor {
            opacity: 1;
            animation: blink 0.7s infinite;
            color: var(--primary-color);
        }
        
        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0; }
            100% { opacity: 1; }
        }
        
        .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg, rgba(78,84,200,0.1) 0%, rgba(143,148,251,0.05) 100%);
            position: relative;
            overflow: hidden;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
        }
        
        .hero-title {
            font-weight: 700;
            font-size: clamp(2.5rem, 5vw, 4rem);
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            line-height: 1.2;
        }
        
        .hero-subtitle {
            font-size: clamp(1.2rem, 2vw, 1.8rem);
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .btn-primary-custom {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(78, 84, 200, 0.3);
            transition: all var(--transition-time) ease;
            position: relative;
            overflow: hidden;
            color: white !important;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(78, 84, 200, 0.4);
        }
        
        .btn-primary-custom:active {
            transform: translateY(1px) scale(0.98);
        }
        
        .btn-outline-primary {
            transition: all var(--transition-time) ease;
        }
        
        .btn-outline-primary:hover {
            transform: translateY(-3px);
        }
        
        .social-links {
            margin-top: 3rem;
        }
        
        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: rgba(78, 84, 200, 0.1);
            color: var(--primary-color);
            margin: 0 10px;
            transition: all var(--transition-time) ease;
            position: relative;
            overflow: hidden;
        }
        
        .social-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            opacity: 0;
            transition: opacity var(--transition-time) ease;
            z-index: -1;
        }
        
        .social-links a:hover {
            color: white;
            transform: translateY(-5px) scale(1.1);
        }
        
        .social-links a:hover::before {
            opacity: 1;
        }
        
        /* Floating shapes animation */
        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .shape {
            position: absolute;
            opacity: 0.1;
            border-radius: 50%;
            filter: blur(40px);
            animation: float 15s infinite ease-in-out;
        }
        
        .shape-1 {
            width: 300px;
            height: 300px;
            background: var(--primary-color);
            top: -100px;
            right: -100px;
            animation-delay: 0s;
        }
        
        .shape-2 {
            width: 200px;
            height: 200px;
            background: var(--secondary-color);
            bottom: -50px;
            left: -50px;
            animation-delay: 2s;
        }
        
        .shape-3 {
            width: 150px;
            height: 150px;
            background: var(--primary-color);
            top: 50%;
            left: 30%;
            animation-delay: 4s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translate(0, 0);
            }
            50% {
                transform: translate(20px, 20px);
            }
        }
        
        /* Scroll down arrow animation */
        .scroll-down {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            color: var(--primary-color);
            animation: bounce 2s infinite;
            cursor: pointer;
            z-index: 10;
        }
        
        .scroll-down:hover {
            color: var(--secondary-color);
        }
        
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0) translateX(-50%);
            }
            40% {
                transform: translateY(-20px) translateX(-50%);
            }
            60% {
                transform: translateY(-10px) translateX(-50%);
            }
        }
        
        /* Typewriter effect */
        .typewriter {
            display: inline-block;
        }
        
        /* Dark mode specific styles */
        .dark-mode .hero-section {
            background: linear-gradient(135deg, rgba(78,84,200,0.2) 0%, rgba(143,148,251,0.1) 100%);
        }
        
        .dark-mode .social-links a {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .dark-mode .social-links a:hover {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
            
            .btn-primary-custom, .btn-outline-primary {
                padding: 10px 20px;
                font-size: 0.9rem;
            }
            
            .social-links a {
                width: 40px;
                height: 40px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <section class="hero-section">
        <div class="floating-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <div class="shape shape-3"></div>
        </div>
        
        <div class="container hero-content">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h6 class="text-uppercase text-primary mb-3 animate__animated animate__fadeIn">Hello, I'm</h6>
                    <h1 class="hero-title animate__animated animate__fadeInUp">Ritika</h1>
                    <h2 class="hero-subtitle animate__animated animate__fadeInUp animate__delay-1s">
                        <span class="typewriter" id="typewriter"></span>
                        <span class="typed-cursor">|</span>
                    </h2>
                    <p class="lead mb-4 animate__animated animate__fadeInUp animate__delay-2s">I build robust, scalable web applications with modern technologies and clean code practices.</p>
                    
                    <div class="d-flex justify-content-center gap-3 animate__animated animate__fadeInUp animate__delay-3s">
                        <a href="/resume.pdf" class="btn btn-primary-custom text-white">
                            <i class="fas fa-download me-2"></i> Download Resume
                        </a>
                        <a href="#contact" class="btn btn-outline-primary">
                            <i class="fas fa-paper-plane me-2"></i> Contact Me
                        </a>
                    </div>
                    
                    <div class="social-links animate__animated animate__fadeInUp animate__delay-4s">
                        <a href="https://github.com/yourusername" target="_blank" aria-label="GitHub">
                            <i class="fab fa-github fa-lg"></i>
                        </a>
                        <a href="https://linkedin.com/in/yourusername" target="_blank" aria-label="LinkedIn">
                            <i class="fab fa-linkedin-in fa-lg"></i>
                        </a>
                        <a href="https://twitter.com/yourusername" target="_blank" aria-label="Twitter">
                            <i class="fab fa-twitter fa-lg"></i>
                        </a>
                        <a href="mailto:your.email@example.com" aria-label="Email">
                            <i class="fas fa-envelope fa-lg"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <a href="#about" class="scroll-down animate__animated animate__fadeIn animate__delay-5s">
            <i class="fas fa-chevron-down fa-2x"></i>
        </a>
    </section>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Typewriter effect
        const typewriterElement = document.getElementById('typewriter');
        const professions = ['Java Full Stack Developer', 'Spring Boot Expert', 'Web Application Developer', 'Software Engineer'];
        let professionIndex = 0;
        let charIndex = 0;
        let isDeleting = false;
        let typingSpeed = 100;
        
        function typeWriter() {
            const currentProfession = professions[professionIndex];
            
            if (isDeleting) {
                typewriterElement.textContent = currentProfession.substring(0, charIndex - 1);
                charIndex--;
                typingSpeed = 50;
            } else {
                typewriterElement.textContent = currentProfession.substring(0, charIndex + 1);
                charIndex++;
                typingSpeed = 100;
            }
            
            if (!isDeleting && charIndex === currentProfession.length) {
                isDeleting = true;
                typingSpeed = 1500; // Pause at end
            } else if (isDeleting && charIndex === 0) {
                isDeleting = false;
                professionIndex = (professionIndex + 1) % professions.length;
                typingSpeed = 500; // Pause before typing next
            }
            
            setTimeout(typeWriter, typingSpeed);
        }
        
        // Start the typewriter effect after a slight delay
        setTimeout(typeWriter, 1000);
        
        // Dark mode toggle functionality
        const darkModeToggle = document.getElementById('darkModeToggle');
        const body = document.body;
        
        if (localStorage.getItem('darkMode') === 'enabled') {
            body.classList.add('dark-mode');
        }
        
        function toggleDarkMode() {
            body.classList.toggle('dark-mode');
            const isDarkMode = body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode ? 'enabled' : 'disabled');
        }
        
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
        
        // Animation on scroll
        function animateOnScroll() {
            const elements = document.querySelectorAll('.animate-on-scroll');
            
            elements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;
                
                if (elementPosition < screenPosition) {
                    element.classList.add('animated');
                }
            });
        }
        
        window.addEventListener('scroll', animateOnScroll);
        document.addEventListener('DOMContentLoaded', animateOnScroll);
        
        // Floating shapes interaction
        document.addEventListener('mousemove', (e) => {
            const shapes = document.querySelectorAll('.shape');
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            
            shapes.forEach((shape, index) => {
                const speed = index * 0.5 + 1;
                shape.style.transform = `translate(${x * 20 * speed}px, ${y * 20 * speed}px)`;
            });
        });
    </script>
</body>
</html>