<%@ page contentType="text/html;charset=UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container-fluid px-3 px-md-4 px-lg-5"> <!-- Improved padding classes -->
        <!-- Brand/logo with animated gradient -->
        <a class="navbar-brand d-flex align-items-center" href="/">
            <span class="gradient-text me-2">Ritika</span>
            <span class="badge bg-primary rounded-pill fs-6 d-none d-sm-inline">Java Full Stack</span>
        </a>
        
        <!-- Mobile toggle button with better touch target -->
        <button class="navbar-toggler p-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" 
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navbar links with improved mobile layout -->
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <li class="nav-item mx-1 mx-lg-0">
                    <a class="nav-link active py-2 py-lg-1" href="/" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home">
                        <i class="fas fa-home me-1"></i> <span class="d-lg-none">Home</span>
                    </a>
                </li>
                <li class="nav-item mx-1 mx-lg-0">
                    <a class="nav-link py-2 py-lg-1" href="/about" data-bs-toggle="tooltip" data-bs-placement="bottom" title="About Me">
                        <i class="fas fa-user me-1"></i> <span class="d-lg-none">About</span>
                    </a>
                </li>
                <li class="nav-item dropdown mx-1 mx-lg-0">
                    <a class="nav-link dropdown-toggle py-2 py-lg-1" href="#" id="skillsDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-code me-1"></i> <span class="d-lg-none">Skills</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="skillsDropdown">
                        <li><a class="dropdown-item py-2" href="/skills#frontend">Frontend</a></li>
                        <li><a class="dropdown-item py-2" href="/skills#backend">Backend</a></li>
                        <li><a class="dropdown-item py-2" href="/skills#database">Database</a></li>
                        <li><hr class="dropdown-divider my-1"></li>
                        <li><a class="dropdown-item py-2" href="/skills#all">All Skills</a></li>
                    </ul>
                </li>
                <li class="nav-item mx-1 mx-lg-0">
                    <a class="nav-link py-2 py-lg-1" href="/projects" data-bs-toggle="tooltip" data-bs-placement="bottom" title="My Projects">
                        <i class="fas fa-project-diagram me-1"></i> <span class="d-lg-none">Projects</span>
                    </a>
                </li>
                <li class="nav-item mx-1 mx-lg-0">
                    <a class="nav-link py-2 py-lg-1" href="/contact" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Contact Me">
                        <i class="fas fa-envelope me-1"></i> <span class="d-lg-none">Contact</span>
                    </a>
                </li>
                <li class="nav-item mx-1 mx-lg-0">
                    <a class="nav-link btn-resume py-2 py-lg-1 px-3" href="/resume.pdf" target="_blank" 
                       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Download Resume">
                        <i class="fas fa-file-pdf me-lg-1"></i> <span class="d-none d-lg-inline">Resume</span>
                    </a>
                </li>
                <!-- Dark mode toggle -->
                <li class="nav-item ms-lg-3 mx-1 mx-lg-0">
                    <button class="btn btn-sm btn-dark-mode p-2" id="darkModeToggle" aria-label="Toggle dark mode">
                        <i class="fas fa-moon" id="darkModeIcon"></i>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    /* Navbar specific styles */
    .navbar {
        padding: 0.5rem 0;
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%) !important;
    }
    
    .navbar.scrolled {
        padding: 0.3rem 0;
    }
    
    .gradient-text {
        background: linear-gradient(90deg, #8f94fb, #4e54c8);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        font-weight: 600;
        animation: gradientShift 8s ease infinite;
        background-size: 200% 200%;
        font-size: 1.1rem;
    }
    
    @keyframes gradientShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    .nav-link {
        position: relative;
        margin: 0 0.1rem;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 0.95rem;
    }
    
    .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 2px;
        background: linear-gradient(90deg, #8f94fb, #4e54c8);
        transition: width 0.3s ease;
    }
    
    .nav-link:hover::after,
    .nav-link.active::after {
        width: 100%;
    }
    
    .btn-resume {
        background: linear-gradient(90deg, #8f94fb, #4e54c8);
        border-radius: 50px;
        padding: 0.4rem 1rem !important;
        color: white !important;
        transition: all 0.3s ease;
        font-size: 0.95rem;
    }
    
    .btn-resume:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(78, 84, 200, 0.4);
    }
    
    .btn-dark-mode {
        border-radius: 50%;
        width: 34px;
        height: 34px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.1);
        border: none;
        color: #fff;
        transition: all 0.3s ease;
    }
    
    .btn-dark-mode:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: rotate(20deg);
    }
    
    .dropdown-menu {
        border: none;
        background: #1a1a2e;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }
    
    .dropdown-item {
        color: rgba(255, 255, 255, 0.8);
        transition: all 0.2s ease;
        font-size: 0.9rem;
    }
    
    .dropdown-item:hover {
        background: rgba(78, 84, 200, 0.2);
        color: white;
        padding-left: 1.25rem;
    }
    
    /* Mobile-specific styles */
    @media (max-width: 992px) {
        .navbar-collapse {
            padding: 0.5rem 1rem;
            background: #1a1a2e;
            border-radius: 0.5rem;
            margin-top: 0.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            max-height: 70vh;
            overflow-y: auto;
        }
        
        .nav-link {
            margin: 0.25rem 0;
            padding: 0.75rem 1rem !important;
            display: flex;
            align-items: center;
        }
        
        .nav-link::after {
            display: none;
        }
        
        .btn-resume {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            margin: 0.25rem 0;
            padding: 0.75rem 1rem !important;
        }
        
        .dropdown-menu {
            margin-left: 1.5rem;
            width: calc(100% - 3rem);
        }
        
        .btn-dark-mode {
            margin: 0.5rem auto;
            display: block;
        }
    }
    
    /* Very small devices (phones, 480px and down) */
    @media (max-width: 480px) {
        .gradient-text {
            font-size: 1rem;
        }
        
        .navbar-brand .badge {
            font-size: 0.7rem;
            padding: 0.25rem 0.5rem;
        }
        
        .navbar-toggler {
            padding: 0.4rem !important;
        }
    }
</style>

<script>
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.getElementById('mainNav');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
    
    // Initialize tooltips only on desktop
    document.addEventListener('DOMContentLoaded', function() {
        if (window.innerWidth > 992) {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        }
        
        // Dark mode toggle functionality
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
    });
    
    // Handle window resize for tooltips
    window.addEventListener('resize', function() {
        if (window.innerWidth <= 992) {
            const tooltips = document.querySelectorAll('.tooltip');
            tooltips.forEach(tooltip => {
                if (tooltip.parentNode) {
                    tooltip.parentNode.removeChild(tooltip);
                }
            });
        }
    });
</script>