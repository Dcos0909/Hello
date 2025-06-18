<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>My Projects | Ritika - Java Full Stack Developer</title>
    <link rel="icon" type="image/svg+xml" href="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/svg/2615.svg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portfolio projects of Ritika, showcasing Java Full Stack development work">
    
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
        
        .projects-header {
            text-align: center;
            margin-bottom: 3rem;
            padding-top: 2rem;
        }
        
        .projects-header h1 {
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .projects-header p {
            font-size: 1.2rem;
            opacity: 0.8;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .project-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            background-color: white;
        }
        
        .dark-mode .project-card {
            background-color: #16213e;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .project-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(78, 84, 200, 0.2);
        }
        
        .project-card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
        }
        
        .project-card-body {
            padding: 2rem;
        }
        
        .tech-badge {
            display: inline-block;
            background-color: rgba(78, 84, 200, 0.1);
            color: var(--primary-color);
            padding: 0.35rem 0.8rem;
            border-radius: 50px;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .dark-mode .tech-badge {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .project-links a {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            margin-right: 1rem;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .project-links a:hover {
            transform: translateY(-2px);
        }
        
        .github-link {
            background-color: rgba(78, 84, 200, 0.1);
            color: var(--primary-color);
        }
        
        .github-link:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        .demo-link {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }
        
        .demo-link:hover {
            box-shadow: 0 5px 15px rgba(78, 84, 200, 0.4);
            color: white;
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
            .project-card-body {
                padding: 1.5rem;
            }
            
            .project-links a {
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <section class="projects-section py-5">
        <div class="container">
            <div class="projects-header animate-on-scroll">
                <h1 class="display-4">My Projects</h1>
                <p>Here are some of my recent full-stack Java projects. Each one represents different aspects of my skills and expertise.</p>
            </div>
            
            <div class="row">
                <!-- Project 1 -->
                <div class="col-lg-6 animate-on-scroll">
                    <div class="project-card">
                        <div class="project-card-header">
                            <h3>Student Feedback System</h3>
                        </div>
                        <div class="project-card-body">
                            <p class="mb-4">A comprehensive system for students to submit anonymous feedback about courses and faculty, with admin analytics dashboard.</p>
                            
                            <div class="mb-4">
                                <span class="tech-badge">Spring Boot</span>
                                <span class="tech-badge">JSP</span>
                                <span class="tech-badge">MySQL</span>
                                <span class="tech-badge">Bootstrap</span>
                                <span class="tech-badge">Chart.js</span>
                            </div>
                            
                            <div class="project-links">
                                <a href="https://github.com/Ritika/student-feedback" target="_blank" class="github-link">
                                    <i class="fab fa-github me-2"></i> View Code
                                </a>
                                <a href="#" class="demo-link">
                                    <i class="fas fa-external-link-alt me-2"></i> Live Demo
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Project 2 -->
                <div class="col-lg-6 animate-on-scroll">
                    <div class="project-card">
                        <div class="project-card-header">
                            <h3>Email Sender App</h3>
                        </div>
                        <div class="project-card-body">
                            <p class="mb-4">A bulk email sender application with real-time progress tracking using WebSocket, supporting attachments and templates.</p>
                            
                            <div class="mb-4">
                                <span class="tech-badge">Spring Boot</span>
                                <span class="tech-badge">WebSocket</span>
                                <span class="tech-badge">Thymeleaf</span>
                                <span class="tech-badge">Redis</span>
                                <span class="tech-badge">jQuery</span>
                            </div>
                            
                            <div class="project-links">
                                <a href="https://github.com/Ritika/email-sender" target="_blank" class="github-link">
                                    <i class="fab fa-github me-2"></i> View Code
                                </a>
                                <a href="#" class="demo-link">
                                    <i class="fas fa-external-link-alt me-2"></i> Live Demo
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Project 3 -->
                <div class="col-lg-6 animate-on-scroll">
                    <div class="project-card">
                        <div class="project-card-header">
                            <h3>PDF Tool</h3>
                        </div>
                        <div class="project-card-body">
                            <p class="mb-4">A web application for processing PDF files with features like compression, merging, splitting, and watermarking.</p>
                            
                            <div class="mb-4">
                                <span class="tech-badge">Spring MVC</span>
                                <span class="tech-badge">PDFBox</span>
                                <span class="tech-badge">React</span>
                                <span class="tech-badge">AWS S3</span>
                                <span class="tech-badge">Docker</span>
                            </div>
                            
                            <div class="project-links">
                                <a href="https://github.com/Ritika/pdf-tool" target="_blank" class="github-link">
                                    <i class="fab fa-github me-2"></i> View Code
                                </a>
                                <a href="#" class="demo-link">
                                    <i class="fas fa-external-link-alt me-2"></i> Live Demo
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Project 4 -->
                <div class="col-lg-6 animate-on-scroll">
                    <div class="project-card">
                        <div class="project-card-header">
                            <h3>E-Commerce API</h3>
                        </div>
                        <div class="project-card-body">
                            <p class="mb-4">A RESTful e-commerce backend with JWT authentication, product catalog, cart system, and payment integration.</p>
                            
                            <div class="mb-4">
                                <span class="tech-badge">Spring Boot</span>
                                <span class="tech-badge">JPA/Hibernate</span>
                                <span class="tech-badge">JWT</span>
                                <span class="tech-badge">PostgreSQL</span>
                                <span class="tech-badge">Swagger</span>
                            </div>
                            
                            <div class="project-links">
                                <a href="#" target="_blank" class="github-link">
                                    <i class="fab fa-github me-2"></i> View Code
                                </a>
                                <a href="#" class="demo-link">
                                    <i class="fas fa-external-link-alt me-2"></i> API Docs
                                </a>
                            </div>
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