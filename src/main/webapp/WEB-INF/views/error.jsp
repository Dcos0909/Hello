<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Maintenance Mode | Ritika's Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #4e54c8;
            --secondary-color: #8f94fb;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: var(--dark-color);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            overflow: hidden;
            position: relative;
        }
        
        .dark-mode {
            background-color: var(--dark-color);
            color: var(--light-color);
        }
        
        .maintenance-container {
            max-width: 800px;
            padding: 2rem;
            position: relative;
            z-index: 2;
        }
        
        .construction-gif {
            width: 300px;
            height: 300px;
            margin: 0 auto 2rem;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        h1 {
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        p.lead {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.8;
        }
        
        .progress {
            height: 8px;
            margin: 2rem auto;
            max-width: 400px;
            background-color: rgba(78, 84, 200, 0.2);
        }
        
        .progress-bar {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            animation: progress 3s ease-in-out infinite;
        }
        
        .btn-home {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 500;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }
        
        .btn-home:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(78, 84, 200, 0.4);
        }
        
        .social-links {
            margin-top: 2rem;
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
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-5px);
        }
        
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
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(20px, 20px); }
        }
        
        @keyframes progress {
            0% { width: 0%; }
            50% { width: 100%; }
            100% { width: 0%; }
        }
        
        /* Dark mode toggle */
        .dark-mode-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 100;
        }
        
        @media (max-width: 768px) {
            .maintenance-container {
                padding: 1.5rem;
            }
            
            .construction-gif {
                width: 200px;
                height: 200px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            p.lead {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
    </div>
    
    <div class="maintenance-container">
        <!-- Construction GIF -->
        <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaDlncHJoNTNlbmNrbWQ1dzVodzl0bno2NmxhYngwZ3R6am1vZDc1dCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/hVJZt4rY9TR5rmmqfc/giphy.gif" 
             alt="Construction worker" 
             class="construction-gif">
        
        <h1>Under Maintenance</h1>
<p class="lead">Please check back soon!</p>

        <div class="progress">
            <div class="progress-bar"></div>
        </div>
        
        <p>Estimated completion: <span id="countdown">30:00</span></p>
        
        <!-- Back to Home Button -->
        <a href="/" class="btn btn-home">
            <i class="fas fa-home me-2"></i> Back to Home
        </a>
        
        <div class="social-links">
            <a href="${pageContext.request.contextPath}/resume"  aria-label="GitHub">
                <i class="fab fa-github"></i>
            </a>
            <a href="${pageContext.request.contextPath}/resume"  aria-label="LinkedIn">
                <i class="fab fa-linkedin-in"></i>
            </a>
            <a href="${pageContext.request.contextPath}/resume" aria-label="Email">
                <i class="fas fa-envelope"></i>
            </a>
        </div>
    </div>
    
    <!-- Dark mode toggle -->
    <button class="btn btn-dark btn-sm dark-mode-toggle" id="darkModeToggle">
        <i class="fas fa-moon" id="darkModeIcon"></i>
    </button>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Countdown timer
        function startCountdown(duration, display) {
            let timer = duration, minutes, seconds;
            const interval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);
                
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                
                display.textContent = minutes + ":" + seconds;
                
                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }
        
        window.onload = function () {
            const thirtyMinutes = 60 * 30;
            const display = document.querySelector('#countdown');
            startCountdown(thirtyMinutes, display);
        };
        
        // Dark mode toggle
        const darkModeToggle = document.getElementById('darkModeToggle');
        const darkModeIcon = document.getElementById('darkModeIcon');
        const body = document.body;
        
        if (localStorage.getItem('darkMode') === 'enabled') {
            body.classList.add('dark-mode');
            darkModeIcon.classList.replace('fa-moon', 'fa-sun');
        }
        
        darkModeToggle.addEventListener('click', function() {
            body.classList.toggle('dark-mode');
            const isDarkMode = body.classList.contains('dark-mode');
            
            if (isDarkMode) {
                darkModeIcon.classList.replace('fa-moon', 'fa-sun');
                localStorage.setItem('darkMode', 'enabled');
            } else {
                darkModeIcon.classList.replace('fa-sun', 'fa-moon');
                localStorage.setItem('darkMode', 'disabled');
            }
        });
    </script>
</body>
</html>