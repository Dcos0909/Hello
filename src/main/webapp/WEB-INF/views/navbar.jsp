<%@ page contentType="text/html;charset=UTF-8" %>
<nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
    <div class="container-fluid px-3 px-md-4 px-lg-5">
        <!-- Brand/logo with animated gradient -->
        <a class="navbar-brand d-flex align-items-center" href="/">
            <span class="gradient-text me-2">Ritika</span>
            <span class="badge bg-primary rounded-pill fs-6 d-none d-sm-inline">Java Full Stack</span>
        </a>
        
        <!-- Mobile toggle button with animated hamburger -->
        <button class="navbar-toggler p-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" 
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
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
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="skillsDropdown">
                        <li><a class="dropdown-item py-2" href="/skills#frontend"><i class="fas fa-paint-brush me-2"></i>Frontend</a></li>
                        <li><a class="dropdown-item py-2" href="/skills#backend"><i class="fas fa-server me-2"></i>Backend</a></li>
                        <li><a class="dropdown-item py-2" href="/skills#database"><i class="fas fa-database me-2"></i>Database</a></li>
                        <li><hr class="dropdown-divider my-1"></li>
                        <li><a class="dropdown-item py-2" href="/skills#all"><i class="fas fa-list-ul me-2"></i>All Skills</a></li>
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
                    <a class="nav-link btn-resume py-2 py-lg-1 px-3" href="${pageContext.request.contextPath}/resume" 
                       data-bs-toggle="tooltip" data-bs-placement="bottom" title="Download Resume">
                        <i class="fas fa-file-pdf me-lg-1"></i> <span class="d-none d-lg-inline">Resume</span>
                    </a>
                </li>

                <!-- Dark mode toggle with smooth transition -->
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
    /* ====== Modern Navbar Styles ====== */
    .navbar {
        padding: 0.75rem 0;
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        backdrop-filter: blur(10px);
        background-color: rgba(26, 26, 46, 0.85) !important;
        border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    }
    
    .navbar.scrolled {
        padding: 0.5rem 0;
        background-color: rgba(22, 22, 36, 0.95) !important;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    }
    
    /* Animated gradient text */
    .gradient-text {
        background: linear-gradient(90deg, #8f94fb, #4e54c8, #8f94fb);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        font-weight: 700;
        animation: gradientShift 8s ease infinite;
        background-size: 200% 200%;
        font-size: 1.25rem;
    }
    
    @keyframes gradientShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    /* Custom hamburger menu */
    .hamburger {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        width: 24px;
        height: 18px;
        cursor: pointer;
    }
    
    .hamburger span {
        display: block;
        width: 100%;
        height: 2px;
        background-color: white;
        transition: all 0.3s ease;
    }
    
    .navbar-toggler[aria-expanded="true"] .hamburger span:nth-child(1) {
        transform: translateY(8px) rotate(45deg);
    }
    
    .navbar-toggler[aria-expanded="true"] .hamburger span:nth-child(2) {
        opacity: 0;
    }
    
    .navbar-toggler[aria-expanded="true"] .hamburger span:nth-child(3) {
        transform: translateY(-8px) rotate(-45deg);
    }
    
    /* Nav link styles */
    .nav-link {
        position: relative;
        margin: 0 0.25rem;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 0.95rem;
        color: rgba(255, 255, 255, 0.85);
    }
    
    .nav-link:hover,
    .nav-link.active {
        color: white !important;
    }
    
    .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background: linear-gradient(90deg, #8f94fb, #4e54c8);
        transition: width 0.3s ease, left 0.3s ease;
    }
    
    .nav-link:hover::after,
    .nav-link.active::after {
        width: 80%;
        left: 50%;
    }
    
    /* Resume button */
    .btn-resume {
        background: linear-gradient(90deg, #8f94fb, #4e54c8);
        border-radius: 8px;
        padding: 0.5rem 1.25rem !important;
        color: white !important;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        font-size: 0.95rem;
        border: none;
        box-shadow: 0 2px 10px rgba(78, 84, 200, 0.3);
    }
    
    .btn-resume:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
    }
    
    /* Dark mode toggle */
    .btn-dark-mode {
        border-radius: 8px;
        width: 38px;
        height: 38px;
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
        transform: rotate(15deg);
    }
    
    /* Dropdown menu */
    .dropdown-menu {
        border: none;
        backdrop-filter: blur(10px);
        background-color: rgba(30, 30, 46, 0.95);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        border: 1px solid rgba(255, 255, 255, 0.08);
        padding: 0.5rem 0;
        animation: fadeIn 0.2s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(5px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .dropdown-item {
        color: rgba(255, 255, 255, 0.8);
        transition: all 0.2s ease;
        font-size: 0.9rem;
        padding: 0.5rem 1.5rem;
        border-radius: 4px;
        margin: 0 0.5rem;
        width: auto;
    }
    
    .dropdown-item:hover {
        background: linear-gradient(90deg, rgba(78, 84, 200, 0.2), transparent);
        color: white;
        padding-left: 1.75rem;
    }
    
    .dropdown-divider {
        border-color: rgba(255, 255, 255, 0.08);
    }
    
    /* Mobile-specific styles */
    @media (max-width: 992px) {
        .navbar-collapse {
            padding: 1rem;
            backdrop-filter: blur(10px);
            background-color: rgba(26, 26, 46, 0.95) !important;
            border-radius: 12px;
            margin-top: 1rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.08);
            max-height: 70vh;
            overflow-y: auto;
        }
        
        .nav-item {
            margin: 0.25rem 0;
        }
        
        .nav-link {
            padding: 0.75rem 1.25rem !important;
            border-radius: 8px;
            margin: 0.25rem 0;
        }
        
        .nav-link:hover,
        .nav-link.active {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .nav-link::after {
            display: none;
        }
        
        .btn-resume {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            margin: 0.5rem 0 0;
        }
        
        .dropdown-menu {
            margin: 0.5rem 0 0 1rem;
            width: calc(100% - 2rem);
            background-color: rgba(20, 20, 40, 0.95);
        }
        
        .btn-dark-mode {
            margin: 0.75rem auto 0;
            display: flex;
        }
    }
    
    /* Dark mode styles */
    body.dark-mode .navbar {
        background-color: rgba(18, 18, 30, 0.95) !important;
        border-bottom-color: rgba(255, 255, 255, 0.1);
    }
    
    body.dark-mode .navbar.scrolled {
        background-color: rgba(10, 10, 20, 0.98) !important;
    }
    
    body.dark-mode .dropdown-menu {
        background-color: rgba(20, 20, 35, 0.98);
    }
</style>

<script>
    // Enhanced Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.getElementById('mainNav');
        if (window.scrollY > 30) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
    
    // Initialize tooltips with delay
    document.addEventListener('DOMContentLoaded', function() {
        if (window.innerWidth > 992) {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl, {
                    delay: { show: 300, hide: 100 }
                });
            });
        }
        
        // Enhanced dark mode toggle
        const darkModeToggle = document.getElementById('darkModeToggle');
        const darkModeIcon = document.getElementById('darkModeIcon');
        const body = document.body;
        
        // Check for saved preference or system preference
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        if (localStorage.getItem('darkMode') === 'enabled' || (localStorage.getItem('darkMode') === null && prefersDark)) {
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
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 80,
                    behavior: 'smooth'
                });
                
                // Close mobile menu if open
                const navbarToggler = document.querySelector('.navbar-toggler');
                if (navbarToggler && !navbarToggler.classList.contains('collapsed')) {
                    const collapse = new bootstrap.Collapse(document.getElementById('navbarResponsive'));
                    collapse.hide();
                }
            }
        });
    });
</script>