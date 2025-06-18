<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>My Skills | Ritika - Java Full Stack Developer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Technical skills of Ritika, Java Full Stack Developer">
    
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
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: #333;
            transition: all 0.3s ease;
        }
        
        .dark-mode {
            background-color: var(--dark-color);
            color: var(--light-color);
        }
        
        .skills-header {
            text-align: center;
            margin-bottom: 3rem;
            padding-top: 2rem;
        }
        
        .skills-header h1 {
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .skills-header p {
            font-size: 1.2rem;
            opacity: 0.8;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            justify-content: center;
        }
        
        .skill-category {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            width: 100%;
            max-width: 350px;
        }
        
        .dark-mode .skill-category {
            background-color: #16213e;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .skill-category:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(78, 84, 200, 0.15);
        }
        
        .skill-category h3 {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .dark-mode .skill-category h3 {
            color: var(--secondary-color);
        }
        
        .skill-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .dark-mode .skill-item {
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .skill-item:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }
        
        .skill-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(78, 84, 200, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary-color);
            font-size: 1.1rem;
        }
        
        .dark-mode .skill-icon {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--secondary-color);
        }
        
        .skill-name {
            flex-grow: 1;
            font-weight: 500;
        }
        
        .skill-level {
            width: 100px;
            height: 6px;
            background-color: rgba(78, 84, 200, 0.1);
            border-radius: 3px;
            overflow: hidden;
            margin-top: 0.5rem;
        }
        
        .dark-mode .skill-level {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .level-bar {
            height: 100%;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border-radius: 3px;
        }
        
        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }
        
        .animate-on-scroll.animated {
            opacity: 1;
            transform: translateY(0);
        }
        
        @media (max-width: 768px) {
            .skill-category {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <section class="skills-section py-5">
        <div class="container">
            <div class="skills-header animate-on-scroll">
                <h1 class="display-4">My Skills</h1>
                <p>Here's a comprehensive overview of my technical skills and competencies as a Java Full Stack Developer.</p>
            </div>
            
            <div class="skills-container">
                <!-- Backend Skills -->
                <div class="skill-category animate-on-scroll">
                    <h3><i class="fas fa-server"></i> Backend Development</h3>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-java"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Core Java</div>
                            <div class="skill-level"><div class="level-bar" style="width: 95%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-leaf"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Spring Framework</div>
                            <div class="skill-level"><div class="level-bar" style="width: 90%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-lock"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Spring Security</div>
                            <div class="skill-level"><div class="level-bar" style="width: 85%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-database"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Hibernate/JPA</div>
                            <div class="skill-level"><div class="level-bar" style="width: 88%"></div></div>
                        </div>
                    </div>
                </div>
                
                <!-- Frontend Skills -->
                <div class="skill-category animate-on-scroll">
                    <h3><i class="fas fa-laptop-code"></i> Frontend Development</h3>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-html5"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">HTML5</div>
                            <div class="skill-level"><div class="level-bar" style="width: 90%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-css3-alt"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">CSS3</div>
                            <div class="skill-level"><div class="level-bar" style="width: 85%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-js"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">JavaScript</div>
                            <div class="skill-level"><div class="level-bar" style="width: 80%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-bootstrap"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Bootstrap</div>
                            <div class="skill-level"><div class="level-bar" style="width: 88%"></div></div>
                        </div>
                    </div>
                </div>
                
                <!-- Database & Tools -->
                <div class="skill-category animate-on-scroll">
                    <h3><i class="fas fa-database"></i> Database & Tools</h3>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-database"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">MySQL</div>
                            <div class="skill-level"><div class="level-bar" style="width: 85%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fab fa-git-alt"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Git</div>
                            <div class="skill-level"><div class="level-bar" style="width: 90%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-code-branch"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">REST APIs</div>
                            <div class="skill-level"><div class="level-bar" style="width: 88%"></div></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <div class="skill-icon"><i class="fas fa-box"></i></div>
                        <div class="skill-details">
                            <div class="skill-name">Maven</div>
                            <div class="skill-level"><div class="level-bar" style="width: 82%"></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
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
        
        // Dark mode check (should match navbar implementation)
        if (localStorage.getItem('darkMode') === 'enabled') {
            document.body.classList.add('dark-mode');
        }
    </script>
</body>
</html>