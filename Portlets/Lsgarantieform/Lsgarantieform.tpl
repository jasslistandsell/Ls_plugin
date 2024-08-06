<meta http-equiv="Content-Type" content="text/html; " /> 
{assign 'title' $instance->getProperty('title')} {assign 'description' $instance->getProperty('description')}
<div class="lssforms">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2>{$title}</h2>
				<form action="https://enesse.shop-template.de/return-policy-form" method="POST" enctype="multipart/form-data" id="gruntfrm">
					<div id="step1">
						<div class="row">
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="">Rechnungsnummer</label>
								</div>
								<input type="text" id="rechnungsnummer" name="rechnungsnummer" class="form-control" required>
								<br>
								<br> </div>
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="">Firma*</label>
								</div>
								<input type="text" id="firma" name="firma" class="form-control">
								<br>
								<br> </div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="input-block">
									<div class="dtaa-infor">
										<label for="">Vorname</label>
									</div>
									<input type="text" id="firstname" name="firstname" class="form-control">
									<br>
									<br> </div>
							</div>
							<div class="col-sm-6">
								<div class="input-block">
									<div class="dtaa-infor">
										<label for="">Nachname</label>
									</div>
									<input type="text" id="lastname" name="lastname" class="form-control">
									<br>
									<br> </div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="">Straße / Hausnummer* </label>
								</div>
								<input type="text" id="hausnummer" name="hausnummer" required class="form-control">
								<br>
								<br> </div>
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="plz">PLZ</label>
								</div>
								<input type="text" id="plz" name="plz" required class="form-control">
								<br>
								<br> </div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="ort">Ort</label>
								</div>
								<input type="text" id="ort" name="ort" required class="form-control">
								<br>
								<br> </div>
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="land">Land</label>
								</div>
								<select class="form-control" name="country">
									<option value="Deutschland">Deutschland</option>
								</select>
								<br>
								<br> </div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="phone">Telefonnummer</label>
								</div>
								<input type="tel" id="phone" name="phone" required class="form-control">
								<br>
								<br> </div>
							<div class="col-sm-6">
								<div class="dtaa-infor">
									<label for="email">Email*</label>
								</div>
								<input type="email" id="email" name="email" required class="form-control">
								<br>
								<br> </div>
						</div>
						<!----
			<div id="step2" style="display: none;">
				<div class="dtaa-infor">
					<label>Vorname / Nachname* </label>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="input-block">
							<label for="">Vorname</label>
							<input type="text" id="firstname" name="firstname" class="form-control">
							<br>
							<br> </div>
					</div>
					<div class="col-sm-6">
						<div class="input-block">
							<label for="">Nachname</label>
							<input type="text" id="lastname" name="lastname" class="form-control">
							<br>
							<br> </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="dtaa-infor">
							<label for="">Straße / Hausnummer* </label>
						</div>
						<input type="text" id="hausnummer" name="hausnummer" required class="form-control">
						<br>
						<br> </div>
					<div class="col-sm-6">
						<div class="dtaa-infor">
							<label for="plz">PLZ</label>
						</div>
						<input type="text" id="plz" name="plz" required class="form-control">
						<br>
						<br> </div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<label for="ort">Ort</label>
						<input type="text" id="ort" name="ort" required class="form-control">
						<br>
						<br> </div>
					<div class="col-sm-6">
						<div class="dtaa-infor"> <span>13.</span>
							<label for="land">Land</label>
						</div>
						<select class="form-control" name="country">
				
							<option value="Deutschland">Deutschland</option>
							<option value="Österreich">Österreich</option>
							<option value="Schweiz">Schweiz</option>
						</select>
						<br>
						<br> </div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="dtaa-infor"> <span>14.</span>
							<label for="phone">Telefonnummer</label>
						</div>
						<input type="tel" id="phone" name="phone" required class="form-control">
						<br>
						<br> </div>
					<div class="col-sm-6">
						<div class="dtaa-infor"> <span>15.</span>
							<label for="email">Email*</label>
						</div>
						<input type="email" id="email" name="email" required class="form-control">
						<br>
						<br> </div>
				</div>-->
						<div class="subbtn col-sm-6">
							<input type="submit" name="r_submit" value="Submit"> </div>
				</form>
				</div>
				<!--------<button id="prevBtn" onclick="prevStep()">Vorherige</button>
		<button id="nextBtn" onclick="nextStep()">Nächste</button> ------->
			</div>
			<div class="col-sm-4">
				<div class="form detils">
					<p>{$description}</p>
				</div>
			</div>
		</div>
	</div>