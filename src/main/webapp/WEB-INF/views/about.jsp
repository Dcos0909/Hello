<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>About Me | Ritika - Java Full Stack Developer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="About Ritika, a passionate Java Full Stack Developer">
    
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
        
        .about-header {
            text-align: center;
            margin-bottom: 3rem;
            padding-top: 2rem;
        }
        
        .about-header h1 {
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .about-header p {
            font-size: 1.2rem;
            opacity: 0.8;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .about-container {
            display: flex;
            flex-wrap: wrap;
            gap: 3rem;
            align-items: center;
            margin-bottom: 4rem;
        }
        
        .profile-image {
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        
        .dark-mode .profile-image {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
        
        .profile-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        .about-content {
            flex: 2;
            min-width: 300px;
        }
        
        .about-content h2 {
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }
        
        .dark-mode .about-content h2 {
            color: var(--secondary-color);
        }
        
        .about-content p {
            margin-bottom: 1.5rem;
            line-height: 1.8;
        }
        
        .skills-highlight {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin: 2rem 0;
        }
        
        .skill-pill {
            background-color: rgba(78, 84, 200, 0.1);
            color: var(--primary-color);
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .dark-mode .skill-pill {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .timeline {
            position: relative;
            max-width: 800px;
            margin: 3rem auto;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            width: 2px;
            background-color: rgba(78, 84, 200, 0.2);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -1px;
        }
        
        .dark-mode .timeline::before {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        
        .timeline-item:nth-child(odd) {
            left: 0;
        }
        
        .timeline-item:nth-child(even) {
            left: 50%;
        }
        
        .timeline-content {
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        
        .dark-mode .timeline-content {
            background-color: #16213e;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .timeline-content h3 {
            margin-top: 0;
            color: var(--primary-color);
        }
        
        .dark-mode .timeline-content h3 {
            color: var(--secondary-color);
        }
        
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 50%;
            top: 15px;
            z-index: 1;
        }
        
        .timeline-item:nth-child(odd)::after {
            right: -10px;
        }
        
        .timeline-item:nth-child(even)::after {
            left: -10px;
        }
        
        @media (max-width: 768px) {
            .timeline::before {
                left: 31px;
            }
            
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            
            .timeline-item:nth-child(even) {
                left: 0;
            }
            
            .timeline-item::after {
                left: 21px;
            }
            
            .timeline-item:nth-child(odd)::after {
                right: auto;
                left: 21px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <section class="about-section py-5">
        <div class="container">
            <div class="about-header animate-on-scroll">
                <h1 class="display-4">About Me</h1>
                <p>Get to know more about my journey, skills, and professional experience</p>
            </div>
            
            <div class="about-container animate-on-scroll">
                <div class="profile-image">
                    <!-- Replace with your actual profile image -->
                    <img src="https://images.unsplash.com/photo-1571171637578-41bc2dd41cd2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80" alt="Ritika - Java Full Stack Developer">
                </div>
                
                <div class="about-content">
                    <h2>Who I Am</h2>
                    <p>I'm Ritika, a passionate Java Full Stack Developer with expertise in building robust, scalable web applications. With a strong foundation in Java technologies and a keen eye for detail, I specialize in creating efficient, user-friendly solutions that solve real-world problems.</p>
                    
                    <p>My journey in software development began with a fascination for problem-solving and has evolved into a career dedicated to crafting clean, maintainable code and intuitive user experiences. I believe in continuous learning and staying updated with the latest industry trends.</p>
                    
                    <div class="skills-highlight">
                        <span class="skill-pill">Java</span>
                        <span class="skill-pill">Spring Boot</span>
                        <span class="skill-pill">Hibernate</span>
                        <span class="skill-pill">JSP/Servlets</span>
                        <span class="skill-pill">MySQL</span>
                        <span class="skill-pill">REST APIs</span>
                        <span class="skill-pill">JavaScript</span>
                        <span class="skill-pill">Bootstrap</span>
                    </div>
                    
                    <a href="/resume.pdf" class="btn btn-primary" style="background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)); border: none; padding: 0.8rem 2rem; border-radius: 50px;">
                        <i class="fas fa-download me-2"></i> Download Resume
                    </a>
                </div>
            </div>
            
            <!-- Experience Timeline -->
            <div class="timeline animate-on-scroll">
                <h2 class="text-center mb-5" style="background: linear-gradient(to right, var(--primary-color), var(--secondary-color)); -webkit-background-clip: text; background-clip: text; color: transparent;">My Journey</h2>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3>Java Developer</h3>
                        <p><strong>ABC Tech Solutions</strong> | 2021 - Present</p>
                        <p>Developed and maintained enterprise-level applications using Spring Boot and Hibernate. Led a team of 3 developers to deliver a customer portal that improved client satisfaction by 30%.</p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3>Software Engineer</h3>
                        <p><strong>XYZ Software</strong> | 2019 - 2021</p>
                        <p>Built RESTful APIs for mobile applications and implemented authentication using Spring Security. Reduced API response time by 40% through optimization techniques.</p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <h3>Bachelor's in Computer Science</h3>
                        <p><strong>University of Technology</strong> | 2015 - 2019</p>
                        <p>Graduated with honors, specializing in software engineering. Completed coursework in data structures, algorithms, and web development.</p>
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