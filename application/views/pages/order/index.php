<div class="container">

	<div class="row mt-4 mb-3">
		<div class="col-11">
			<h2>List Users Orders</h2>
		</div>
		<div class="col float-right" button onClick="window.print();">
			<a href="<?= base_url('order') ?>" class="btn btn-danger btn-sm">
				<i class="fas fa-print"></i>
				Print
			</a>
		</div>
	</div>


	<?php $this->load->view('layouts/_alert') ?>

	<div class="row mt-3">
		<div class="col">
			<table class="table table-bordered table-light text-center">
				<thead class="thead-dark">
					<tr>
						<th>Invoice</th>
						<th>Date</th>
						<th>Total</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach($orders as $o) : ?>
						<tr>
							<td><a href="<?= base_url('order/detail/' . $o['id']) ?>"><strong><?= $o['invoice'] ?></strong></a></td>
							<td><?= $o['date'] ?></td>
							<td>Rp. <?= number_format($o['total'], 2, ',', '.') ?></td>
							<td>
								<?php if($o['status'] == 'waiting') : ?>
									<span class="badge badge-primary"><?= $o['status'] ?></span>
								<?php elseif($o['status'] == 'paid') : ?>
									<span class="badge badge-warning text-light"><?= $o['status'] ?></span>
								<?php elseif($o['status'] == 'delivered') : ?>
									<span class="badge badge-info"><?= $o['status'] ?></span>
								<?php elseif($o['status'] == 'cancel') : ?>
									<span class="badge badge-danger"><?= $o['status'] ?></span>
								<?php endif; ?>
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>

</div>
