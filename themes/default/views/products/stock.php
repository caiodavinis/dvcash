<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<script type="text/javascript">
    $(document).ready(function() {
        function image(n) {
            if(n !== null) {
                return '<div style="width:32px; margin: 0 auto;"><a href="<?=base_url();?>uploads/'+n+'" class="open-image"><img src="<?=base_url();?>uploads/thumbs/'+n+'" alt="" class="img-responsive"></a></div>';
            }
            return '';
        }
        function method(n) {
            return (n == 0) ? '<span class="label label-primary"><?= lang('inclusive'); ?></span>' : '<span class="label label-warning"><?= lang('exclusive'); ?></span>';
        }
        $('#fileData').dataTable( {
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, '<?= lang('all'); ?>']],
            "aaSorting": [[ 1, "asc" ]], "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= site_url('products/get_products_stock') ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            "aoColumns": [null, null, null]
        });
        //{"data":"tax_method","render":method},
        $('#fileData').on('click', '.image', function() {
            var a_href = $(this).attr('href');
            var code = $(this).attr('id');
            $('#myModalLabel').text(code);
            $('#product_image').attr('src',a_href);
            $('#picModal').modal();
            return false;
        });
        $('#fileData').on('click', '.barcode', function() {
            var a_href = $(this).attr('href');
            var code = $(this).attr('id');
            $('#myModalLabel').text(code);
            $('#product_image').attr('src',a_href);
            $('#picModal').modal();
            return false;
        });
        $('#fileData').on('click', '.open-image', function() {
            var a_href = $(this).attr('href');
            var code = $(this).closest('tr').find('.image').attr('id');
            $('#myModalLabel').text(code);
            $('#product_image').attr('src',a_href);
            $('#picModal').modal();
            return false;
        });


    });

</script>
<style type="text/css">
    .table td:first-child { padding: 1px; }
    .table td:nth-child(6), .table td:nth-child(7), .table td:nth-child(8) { text-align: center; }
    .table td:nth-child(9)<?= $Admin ? ', .table td:nth-child(10)' : ''; ?> { text-align: right; }
</style>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Relatório de Estoque: <?=date('d/m/Y h:m:s')?></h3>
                </div>
                <div class="box-body">
                        <div class="table-responsive">
                        <table id="fileData" class="table table-striped table-bordered table-hover" style="margin-bottom:5px;">
                            <thead>
                            <tr class="active">
                                <th style="width: 10%"><?= lang("code"); ?></th>
                                <th style="width: 30%"><?= lang("name"); ?></th>
                                <th style="width: 20%"><?= lang("quantity"); ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="10" class="dataTables_empty"><?= lang('loading_data_from_server'); ?></td>
                            </tr>
                            </tbody>
                        </table>
                        </div>


                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>
