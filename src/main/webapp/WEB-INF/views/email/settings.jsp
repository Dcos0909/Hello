<div class="form-group">
	<label>Authentication Method</label>
	<div class="row">
		<div class="col-md-6">
			<div class="custom-control custom-radio">
				<input class="custom-control-input" type="radio" id="app-password" name="auth-method" value="app-password" x-model="authMethod">
				<label for="app-password" class="custom-control-label">
					<i class="fas fa-key text-primary"></i> App Password
				</label>
			</div>
		</div>
		<div class="col-md-6">
			<div class="custom-control custom-radio">
				<input class="custom-control-input" type="radio" id="oauth2" name="auth-method" value="oauth2" x-model="authMethod" disabled>
				<label for="oauth2" class="custom-control-label text-muted">
					<i class="fas fa-shield-alt"></i> OAuth2 (Coming Soon)
				</label>
			</div>
		</div>
	</div>
</div>
<div x-show="authMethod === 'app-password'">
	<div class="form-group">
		<label>Gmail Address</label>
		<input type="email" x-model="credentials.email" class="form-control" placeholder="your-email@gmail.com" required>
	</div>
	<div class="form-group">
		<label>App Password</label>
		<input type="password" x-model="credentials.password" class="form-control" placeholder="16-character app password" required>
		<small class="form-text text-muted">Generate from Google Account → Security → 2-Step Verification → App passwords</small>
	</div>
</div>