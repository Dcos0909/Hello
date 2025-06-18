<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Contact Me | Ritika - Java Full Stack Developer</title>
    <link rel="icon" type="image/svg+xml" href="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/svg/2615.svg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Contact information for Ritika, Java Full Stack Developer">
    
    <!-- Bootstrap 5 with dark mode support -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-dark-5@1.1.3/dist/css/bootstrap-dark.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
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
        
        .contact-header {
            text-align: center;
            margin-bottom: 3rem;
            padding-top: 2rem;
        }
        
        .contact-header h1 {
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .contact-header p {
            font-size: 1.2rem;
            opacity: 0.8;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .contact-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
        }
        
        .contact-card {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            width: 100%;
            max-width: 350px;
            text-align: center;
        }
        
        .dark-mode .contact-card {
            background-color: #16213e;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(78, 84, 200, 0.15);
        }
        
        .contact-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 1.5rem;
        }
        
        .contact-card h3 {
            margin-bottom: 1rem;
            color: var(--primary-color);
        }
        
        .dark-mode .contact-card h3 {
            color: var(--secondary-color);
        }
        
        .contact-link {
            display: inline-block;
            color: inherit;
            text-decoration: none;
            transition: all 0.3s ease;
            word-break: break-all;
        }
        
        .contact-link:hover {
            color: var(--primary-color);
            transform: translateX(5px);
        }
        
        .dark-mode .contact-link:hover {
            color: var(--secondary-color);
        }
        
        .contact-form {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 3rem;
        }
        
        .dark-mode .contact-form {
            background-color: #16213e;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .form-control {
            padding: 0.8rem 1rem;
            border-radius: 8px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .dark-mode .form-control {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 84, 200, 0.25);
        }
        
        .btn-send {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 0.8rem 2rem;
            font-weight: 500;
            border-radius: 50px;
            color: white;
            transition: all 0.3s ease;
        }
        
        .btn-send:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(78, 84, 200, 0.4);
        }
        
        @media (max-width: 768px) {
            .contact-card {
                padding: 1.5rem;
            }
            
            .contact-form {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <section class="contact-section py-5">
        <div class="container">
            <div class="contact-header">
                <h1 class="display-4">Get In Touch</h1>
                <p>Feel free to reach out for collaborations, opportunities, or just to say hello!</p>
            </div>
            
            <div class="contact-container">
                <!-- Email Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email</h3>
                    <a href="#" class="contact-link">Ritika@example.com</a>
                </div>
                
                <!-- GitHub Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-github"></i>
                    </div>
                    <h3>GitHub</h3>
                    <a href="#" target="_blank" class="contact-link">github.com/Ritika</a>
                </div>
                
                <!-- LinkedIn Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </div>
                    <h3>LinkedIn</h3>
                    <a href="#" target="_blank" class="contact-link">linkedin.com/in/Ritika</a>
                </div>
                
                <!-- Phone Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <h3>Phone</h3>
                    <span class="contact-link">+91-XXXXXXXXXX</span>
                </div>
            </div>
            
            <!-- Contact Form -->
            <div class="contact-form">
                <h2 class="text-center mb-4">Send Me a Message</h2>
                <form action="/send-message" method="POST">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                        </div>
                        <div class="col-md-6">
                            <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                        </div>
                    </div>
                    <input type="text" class="form-control" name="subject" placeholder="Subject">
                    <textarea class="form-control" name="message" rows="5" placeholder="Your Message" required></textarea>
                    <div class="text-center">
                        <button type="submit" class="btn btn-send">
                            <i class="fas fa-paper-plane me-2"></i> Send Message
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Dark mode check (should match navbar implementation)
        if (localStorage.getItem('darkMode') === 'enabled') {
            document.body.classList.add('dark-mode');
        }
        
        // Form submission handling
        document.querySelector('form').addEventListener('submit', function(e) {
            e.preventDefault();
            // You would typically add AJAX form submission here
            alert('Message sent successfully!');
            this.reset();
        });
    </script>
</body>
</html>