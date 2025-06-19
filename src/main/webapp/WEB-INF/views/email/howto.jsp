<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>How to Use - EmailFlow Pro</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>❓</text></svg>">

<!-- AdminLTE CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>

<body class="hold-transition sidebar-mini layout-fixed" x-data="{ mobileMenuOpen: false, showSettings: false }">
<div class="wrapper">
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-widget="pushmenu" href="#" role="button">
					<i class="fas fa-bars"></i>
				</a>
			</li>
			<li class="nav-item d-none d-sm-inline-block">
				<span class="nav-link">EmailFlow Pro - How to Use Guide</span>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a href="/" class="nav-link">
					<i class="fas fa-home"></i> Back to Main
				</a>
			</li>
		</ul>
	</nav>

	<!-- Main Sidebar -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<a href="/" class="brand-link">
			<span class="brand-text font-weight-light">
				<i class="fas fa-bolt text-warning"></i> EmailFlow Pro
			</span>
		</a>
		<div class="sidebar">
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item">
						<a href="/email/" class="nav-link">
							<i class="nav-icon fas fa-envelope"></i>
							<p>Campaigns</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/email/howto" class="nav-link active">
							<i class="nav-icon fas fa-question-circle"></i>
							<p>How to Use</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link" @click.prevent="showSettings = true">
							<i class="nav-icon fas fa-cog"></i>
							<p>Settings</p>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</aside>

	<!-- Content Wrapper -->
	<div class="content-wrapper">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">How to Use EmailFlow Pro</h1>
					</div>
				</div>
			</div>
		</div>

		<section class="content">
			<div class="container-fluid">
				<!-- Quick Start -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"><i class="fas fa-rocket text-success"></i> Quick Start Guide</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-3 text-center">
								<div class="bg-primary rounded p-3 mb-2">
									<i class="fas fa-cog fa-2x text-white"></i>
								</div>
								<h5>1. Setup Email</h5>
								<p class="text-muted">Configure Gmail credentials in Settings</p>
							</div>
							<div class="col-md-3 text-center">
								<div class="bg-info rounded p-3 mb-2">
									<i class="fas fa-upload fa-2x text-white"></i>
								</div>
								<h5>2. Upload List</h5>
								<p class="text-muted">Upload .txt or .csv file with email addresses</p>
							</div>
							<div class="col-md-3 text-center">
								<div class="bg-warning rounded p-3 mb-2">
									<i class="fas fa-edit fa-2x text-white"></i>
								</div>
								<h5>3. Write Email</h5>
								<p class="text-muted">Create subject and message content</p>
							</div>
							<div class="col-md-3 text-center">
								<div class="bg-success rounded p-3 mb-2">
									<i class="fas fa-paper-plane fa-2x text-white"></i>
								</div>
								<h5>4. Send Campaign</h5>
								<p class="text-muted">Launch and monitor your email campaign</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Gmail App Password Setup -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"><i class="fas fa-key text-warning"></i> How to Get Gmail App Password</h3>
					</div>
					<div class="card-body">
						<div class="alert alert-info">
							<i class="fas fa-info-circle"></i> <strong>Important:</strong> You need a Gmail App Password, not your regular Gmail password.
						</div>
						<ol class="list-group list-group-numbered">
							<li class="list-group-item">Go to <a href="https://myaccount.google.com" target="_blank">Google Account Settings</a></li>
							<li class="list-group-item">Click on <strong>Security</strong> in the left menu</li>
							<li class="list-group-item">Enable <strong>2-Step Verification</strong> if not already enabled</li>
							<li class="list-group-item">Scroll down and click <strong>App passwords</strong></li>
							<li class="list-group-item">Select <strong>Mail</strong> and <strong>Other (Custom name)</strong></li>
							<li class="list-group-item">Enter "EmailFlow Pro" as the app name</li>
							<li class="list-group-item">Click <strong>Generate</strong></li>
							<li class="list-group-item">Copy the 16-character password (like: <code>abcd efgh ijkl mnop</code>)</li>
							<li class="list-group-item">Use this password in EmailFlow Pro Settings</li>
						</ol>
					</div>
				</div>

				<!-- Step by Step Usage -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"><i class="fas fa-list-ol text-primary"></i> Detailed Usage Instructions</h3>
					</div>
					<div class="card-body">
						<div class="accordion" id="usageAccordion">
							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse" data-target="#step1">
											<i class="fas fa-cog"></i> Step 1: Configure Email Settings
										</button>
									</h5>
								</div>
								<div id="step1" class="collapse show" data-parent="#usageAccordion">
									<div class="card-body">
										<ul>
											<li>Click the <i class="fas fa-cog"></i> Settings icon in the top navigation</li>
											<li>Enter your Gmail address (e.g., yourname@gmail.com)</li>
											<li>Enter your Gmail App Password (16 characters)</li>
											<li>Click <strong>Save Configuration</strong></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#step2">
											<i class="fas fa-upload"></i> Step 2: Upload Email List
										</button>
									</h5>
								</div>
								<div id="step2" class="collapse" data-parent="#usageAccordion">
									<div class="card-body">
										<ul>
											<li>Prepare a .txt or .csv file with email addresses</li>
											<li>One email per line (e.g., user1@example.com)</li>
											<li>Click <strong>Choose file</strong> in the Email Recipients section</li>
											<li>Select your email list file</li>
											<li>System will automatically load and validate emails</li>
										</ul>
										<div class="alert alert-success">
											<strong>Supported formats:</strong> .txt, .csv files with emails
										</div>
										<h6><i class="fas fa-file-alt"></i> Email List Format Examples:</h6>
										<div class="row">
											<div class="col-md-6">
												<strong>📄 example.txt (New Line Separated):</strong>
												<pre class="bg-light p-2 rounded">user1@gmail.com
user2@yahoo.com
user3@hotmail.com
admin@company.com
support@website.org</pre>
											</div>
											<div class="col-md-6">
												<strong>📊 example.csv (Comma Separated):</strong>
												<pre class="bg-light p-2 rounded">user1@gmail.com,user2@yahoo.com,user3@hotmail.com
admin@company.com,support@website.org
contact@business.net,info@startup.io</pre>
											</div>
										</div>
										<div class="alert alert-info mt-2">
											<i class="fas fa-info-circle"></i> <strong>Both formats work:</strong> One email per line OR comma-separated emails
										</div>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#step3">
											<i class="fas fa-edit"></i> Step 3: Create Email Content
										</button>
									</h5>
								</div>
								<div id="step3" class="collapse" data-parent="#usageAccordion">
									<div class="card-body">
										<ul>
											<li>Enter a compelling <strong>Subject Line</strong></li>
											<li>Write your email message in the rich text editor</li>
											<li>Set <strong>Delay</strong> between emails (0 = no delay)</li>
											<li>Choose <strong>Send Mode</strong>: Asynchronous (faster) or Synchronous</li>
											<li>Optionally attach files (up to 10MB)</li>
											<li>Click <strong>Preview</strong> to review your email</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#step4">
											<i class="fas fa-paper-plane"></i> Step 4: Launch Campaign
										</button>
									</h5>
								</div>
								<div id="step4" class="collapse" data-parent="#usageAccordion">
									<div class="card-body">
										<ul>
											<li>Click <strong>Launch Campaign</strong> to start sending</li>
											<li>Monitor real-time progress in the stats cards</li>
											<li>View individual email status in the table</li>
											<li>Use <strong>Cancel All</strong> for emergency stop</li>
											<li>Download reports after campaign completion</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- FAQ Section -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"><i class="fas fa-question-circle text-info"></i> Frequently Asked Questions (FAQ)</h3>
					</div>
					<div class="card-body">
						<div class="accordion" id="faqAccordion">
							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse" data-target="#faq1">
											❓ Why am I getting "Authentication failed" error?
										</button>
									</h5>
								</div>
								<div id="faq1" class="collapse" data-parent="#faqAccordion">
									<div class="card-body">
										<p><strong>Common causes:</strong></p>
										<ul>
											<li>Using regular Gmail password instead of App Password</li>
											<li>2-Step Verification not enabled on Gmail</li>
											<li>Incorrect App Password (should be 16 characters)</li>
											<li>Spaces in App Password (remove all spaces)</li>
										</ul>
										<div class="alert alert-warning">
											<strong>Solution:</strong> Generate a new Gmail App Password and ensure 2-Step Verification is enabled.
										</div>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#faq2">
											❓ What file formats are supported for email lists?
										</button>
									</h5>
								</div>
								<div id="faq2" class="collapse" data-parent="#faqAccordion">
									<div class="card-body">
										<p><strong>Supported formats:</strong></p>
										<ul>
											<li><strong>.txt files:</strong> One email per line OR comma-separated</li>
											<li><strong>.csv files:</strong> Comma-separated email addresses</li>
											<li>Maximum file size: 10MB</li>
											<li>System automatically validates email format</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">
										<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#faq3">
											❓ How do I cancel individual emails?
										</button>
									</h5>
								</div>
								<div id="faq3" class="collapse" data-parent="#faqAccordion">
									<div class="card-body">
										<p>You can control individual emails in the recipient table:</p>
										<ul>
											<li><strong>Send:</strong> Manually send pending emails</li>
											<li><strong>Cancel:</strong> Stop queued or sending emails</li>
											<li><strong>Resend:</strong> Retry failed or cancelled emails</li>
											<li><strong>Cancel All:</strong> Emergency stop for entire campaign</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Security & Privacy -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"><i class="fas fa-shield-alt text-success"></i> Security & Privacy</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<h5><i class="fas fa-lock text-success"></i> How Secure is EmailFlow Pro?</h5>
								<ul class="list-unstyled">
									<li><i class="fas fa-check text-success"></i> <strong>No Data Storage:</strong> Your emails and credentials are not permanently stored</li>
									<li><i class="fas fa-check text-success"></i> <strong>Local Processing:</strong> All email processing happens on your server</li>
									<li><i class="fas fa-check text-success"></i> <strong>Encrypted Connection:</strong> Uses Gmail's secure SMTP with TLS encryption</li>
									<li><i class="fas fa-check text-success"></i> <strong>App Passwords:</strong> Uses secure Gmail App Passwords, not your main password</li>
									<li><i class="fas fa-check text-success"></i> <strong>Real-time Processing:</strong> Emails are sent immediately, not stored in queues</li>
								</ul>
							</div>
							<div class="col-md-6">
								<h5><i class="fas fa-user-shield text-primary"></i> Privacy Protection</h5>
								<ul class="list-unstyled">
									<li><i class="fas fa-check text-primary"></i> <strong>No Email Tracking:</strong> We don't track email opens or clicks</li>
									<li><i class="fas fa-check text-primary"></i> <strong>No Data Mining:</strong> Your email lists are not analyzed or stored</li>
									<li><i class="fas fa-check text-primary"></i> <strong>Session-based:</strong> Data cleared when you close the application</li>
									<li><i class="fas fa-check text-primary"></i> <strong>Local Reports:</strong> Campaign reports are generated locally</li>
									<li><i class="fas fa-check text-primary"></i> <strong>No Third-party Sharing:</strong> Your data never leaves your control</li>
								</ul>
							</div>
						</div>
						<div class="alert alert-success mt-3">
							<i class="fas fa-info-circle"></i> <strong>Bottom Line:</strong> EmailFlow Pro is designed with privacy-first approach. Your credentials and email lists are processed locally and securely, with no permanent storage or external sharing.
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
</body>
</html>