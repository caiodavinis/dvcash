<?php

include "QRCodeGenerator.class.php";

function product_name($name)
{
    return character_limiter($name, (isset($Settings->char_per_line) ? ($Settings->char_per_line-8) : 35));
}
if ($modal) {
    echo '<div class="modal-dialog no-modal-header"><div class="modal-content"><div class="modal-body"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i></button>';
} else { ?>
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <title><?= $page_title . " " . lang("no") . " " . $inv->id; ?></title>
        <base href="<?= base_url() ?>"/>
        <meta http-equiv="cache-control" content="max-age=0"/>
        <meta http-equiv="cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="0"/>
        <meta http-equiv="pragma" content="no-cache"/>
        <link rel="shortcut icon" href="<?= $assets ?>images/icon.png"/>
        <link href="<?= $assets ?>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <style type="text/css" media="all">
            body { color: #000; }
            #wrapper { max-width: 480px; margin: 0 auto; padding-top: 20px; }
            .btn { border-radius: 0; margin-bottom: 5px; }
            .table { border-radius: 3px; }
            .table th { background: #f5f5f5; }
            .table th, .table td { vertical-align: middle !important; }
            h3 { margin: 5px 0; }

            @media print {
                .no-print { display: none; }
                #wrapper { max-width: 480px; width: 100%; min-width: 250px; margin: 0 auto; }
            }
            .tdpag{
                float: left;
                width: 50%;
                text-align: left;
            }
            .tdpag2{
                float: right;
                width: 50%;
                text-align: right;
            }
            table{
                margin: 0 !important;
            }
        </style>
    </head>

    <body>

<?php } ?>
<div id="wrapper" style="margin-top: -15px;">
    <div id="receiptData">
    <div class="no-print">
        <?php if ($message) { ?>
            <div class="alert alert-success">
                <button data-dismiss="alert" class="close" type="button">×</button>
                <?= is_array($message) ? print_r($message, true) : $message; ?>
            </div>
        <?php } ?>
    </div>
    <div id="receipt-data">
        <div class="text-center">
                <?= $Settings->header; ?>
                <p>
                <?= lang('sale').' '.lang('no').': '.$inv->id; ?> | <?= lang("customer").': '. $inv->customer_name; ?></br><?= lang("date").': '.$this->tec->hrld($inv->date); ?>
                <?php
                $cnpj = explode('/',$inv->cpf);
                if(count($cnpj) > 0){
                    echo ($inv->cpf ? '<br>CNPJ: '.$inv->cpf : '');
                }else{
                    echo ($inv->cpf ? '<br>CPF: '.$inv->cpf : '');
                }
                 
                ?>
                </p>
                <?php
                if($inv->observacao){
                    echo '<table class="table table-striped table-condensed"><tbody>';
                            echo '<tr>';
                                echo '<td style="    width: 100%;
    float: left;
    text-align: center;" class="tdpag"><font size="2" /><b>Observação</b></td>';
                                echo '<td style="width: 100%;
    float: left;
    text-align: center;
    border: none;
    margin-top: -10px;" class="tdpag2"><font size="2" />' . str_replace('%20',' ',$inv->observacao). '</td>';
                            echo '</tr>';
                        echo '</tbody></table>';
                }
                
                ?>
            <div style="clear:both;"></div>
            <table class="table table-striped table-condensed">
                <thead>
                    <tr>
                        <th class="text-center col-xs-10"><font size="1" /><?=lang('description');?></th>
                        <th class="text-center col-xs-1"><font size="1" /><?=lang('quantity');?></th>
                        <th class="text-center col-xs-1"><font size="1" /><?=lang('price');?></th>
                        <th class="text-center col-xs-1"><font size="1" /><?=lang('subtotal');?></th>
                    </tr>
                </thead>
                <tbody>
                <?php
                $tax_summary = array();
                $qtde_total = 0;
                foreach ($rows as $row) {
                    $qtde_total += $this->tec->formatNumber($row->quantity);
                    echo '<tr><td class="text-left"><font size="1" />' . product_name($row->product_name) . '</td>';
                    echo '<td class="text-center"><font size="1" />' . $this->tec->formatNumber($row->quantity) . '</td>';
                    echo '<td class="text-right"><font size="1" />';

                    if ($inv->total_discount != 0) {
                        $price_with_discount = $this->tec->formatMoney($row->net_unit_price + $this->tec->formatDecimal($row->item_discount / $row->quantity));
                        $pr_tax = $row->tax_method ?
                        $this->tec->formatDecimal((($price_with_discount) * $row->tax) / 100) :
                        $this->tec->formatDecimal((($price_with_discount) * $row->tax) / (100 + $row->tax));
                        //echo '<del>' . $this->tec->formatMoney($price_with_discount+$pr_tax) . '</del> ';
                    }

                    echo $this->tec->formatMoney($row->net_unit_price + ($row->item_tax / $row->quantity)) . '</td><td class="text-right"><font size="1" />' . $this->tec->formatMoney($row->subtotal) . '</td></tr>';
                }
                ?>
                </tbody>
                <tfoot>
                <tr>
                    <th colspan="2" style="font-size: 12px;">Quantidade de iten(s)</th>
                    <th colspan="2" style="font-size: 12px;" class="text-right"><?= $qtde_total; ?></th>
                </tr>
                <tr>
                    <th colspan="2" style="font-size: 12px;">Valor Total</th>
                    <th colspan="2" style="font-size: 12px;" class="text-right">R$ <?= $this->tec->formatMoney($inv->total); ?></th>
                </tr>
                <?php
                if ($inv->order_tax != 0) {
                    echo '<tr><th colspan="2">' . lang("order_tax") . '</th><th colspan="2" class="text-right"><font size="1" />' . $this->tec->formatMoney($inv->order_tax) . '</th></tr>';
                }
                if ($inv->total_discount != 0) {
                    echo '<tr><th colspan="2">' . lang("order_discount") . '</th><th colspan="2" class="text-right"><font size="1" />' . $this->tec->formatMoney($inv->total_discount) . '</th></tr>';
                }
                $total = $inv->total - $inv->total_discount;
                if ($inv->total_discount != 0 OR $inv->order_tax != 0) {
                    echo '<tr><th colspan="2">' . lang("grand_total") . '</th><th colspan="2" class="text-right"><font size="1" />' .  $this->tec->formatMoney($total) . '</th></tr>';
                }

                /**
                if ($Settings->rounding) {
                    $round_total = $this->tec->roundNumber($inv->grand_total, $Settings->rounding);
                    $rounding = $this->tec->formatMoney($round_total - $inv->grand_total);
                ?>
                    <tr>
                        <th colspan="2"><?= lang("rounding"); ?></th>
                        <th colspan="2" class="text-right"><?= $rounding; ?></th>
                    </tr>
                    <tr>
                        <th colspan="2"><?= lang("grand_total"); ?></th>
                        <th colspan="2" class="text-right"><?= $this->tec->formatMoney($inv->grand_total + $rounding); ?></th>
                    </tr>
                <?php
                } else {
                    $round_total = $inv->grand_total;
                    ?>
                    <tr>
                        <th colspan="2"><?= lang("grand_total"); ?></th>
                        <th colspan="2" class="text-right"><?= $this->tec->formatMoney($inv->grand_total); ?></th>
                    </tr>
                <?php }
                if ($inv->paid < $round_total) { ?>
                    <tr>
                        <th colspan="2"><?= lang("paid_amount"); ?></th>
                        <th colspan="2" class="text-right"><?= $this->tec->formatMoney($inv->paid); ?></th>
                    </tr>
                    <tr>
                        <th colspan="2"><?= lang("due_amount"); ?></th>
                        <th colspan="2" class="text-right"><?= $this->tec->formatMoney($inv->grand_total - $inv->paid); ?></th>
                    </tr>
                <?php } */ ?>
                </tfoot>
            </table>
            <?php
            if ($payments) {
                echo '<h1 style="font-size: 16px;">FORMA(S) DE PAGAMENTO(S)</h1>';
                echo '<table class="table table-striped table-condensed"><tbody>';
                $total_pago = 0;
                foreach ($payments as $payment) {
                    $total_pago += $this->tec->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid);
                    if ($payment->paid_by == 'cash' && $payment->pos_paid) {
                        echo '<table class="table table-striped table-condensed"><tbody>';
                            echo '<tr>';
                        echo '<td class="tdpag"><font size="2" /><b>' . lang($payment->paid_by) . '</b></td>';
                        echo '<td class="tdpag2"><font size="2" />' . $this->tec->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . '</td>';
                        
                        if($payment->pos_balance > 0){
                            $troco =  '<table class="table table-striped table-condensed"><tbody>
                             <tr>
                                 <td class="tdpag"><font size="2" /><b>TROCO </b></td>
                                 <td class="tdpag2"><font size="2" />R$ '. $this->tec->formatMoney($payment->pos_balance). '</td>
                             </tr>
                         </tbody></table>';
                        
                        }
                         echo '</tr>';
                        echo '</tbody></table>';
                        
                    }else{
                         if(lang($payment->paid_by) == 'CC'){
                            $payment_type = "Cartão de Crédito";
                        }else if(lang($payment->paid_by) == 'Cheque'){
                            $payment_type = "Cheque";
                        }else {
                            $payment_type = "Cartão de Débito";
                        }
                        echo '<table class="table table-striped table-condensed"><tbody>';
                            echo '<tr>';
                                echo '<td class="tdpag"><font size="2" /><b>' . $payment_type . '</b></td>';
                                echo '<td class="tdpag2"><font size="2" />' . $this->tec->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid). '</td>';
                            echo '</tr>';
                        echo '</tbody></table>';

                    }
                    /**
                    if (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->tec->formatMoney($payment->pos_paid) . '</td>';
                        echo '<td>' . lang("no") . ': ' . 'xxxx xxxx xxxx ' . substr($payment->cc_no, -4) . '</td>';
                        echo '<td>' . lang("name") . ': ' . $payment->cc_holder . '</td>';
                    }
                    if ($payment->paid_by == 'Cheque' && $payment->cheque_no) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->tec->formatMoney($payment->pos_paid) . '</td>';
                        echo '<td>' . lang("cheque_no") . ': ' . $payment->cheque_no . '</td>';
                    }
                    if ($payment->paid_by == 'gift_card' && $payment->pos_paid) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("no") . ': ' . $payment->gc_no . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->tec->formatMoney($payment->pos_paid) . '</td>';
                        echo '<td>' . lang("balance") . ': ' . ($payment->pos_balance > 0 ? $this->tec->formatMoney($payment->pos_balance) : 0) . '</td>';
                    }
                    if ($payment->paid_by == 'other' && $payment->amount) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->tec->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . '</td>';
                        echo $payment->note ? '</tr><td colspan="2">' . lang("payment_note") . ': ' . $payment->note . '</td>' : '';
                    }
                    */
                }
                echo '<table style="margin-top: 25px !important;" class="table table-striped table-condensed"><tbody>
                             <tr>
                                 <td class="tdpag"><font size="2" /><b>TOTAL PAGO </b></td>
                                 <td class="tdpag2"><font size="2" />R$ './*$this->tec->formatMoney($inv->total + $inv->order_tax - $inv->total_discount)*/ $this->tec->formatMoney($total_pago) . '</td>
                             </tr>
                         </tbody></table>';
                echo $troco;
                echo '</tbody></table>';
                /**
                $ex1 = new QRCodeGenerator('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=MobLanche_PDVPARATODOS.COM.BR');
                echo "<img src=".$ex1->generate().">";
                */

            }


            ?>

            <?= $inv->note ? '<p class="text-center">' . $this->tec->decode_html($inv->note) . '</p>' : ''; ?>
            <div class="well well-sm">
                <?= $Settings->footer; ?>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
<?php if ($modal) {
    echo '</div></div></div></div>';
} else { ?>
<div id="buttons" style="padding-top:10px; text-transform:uppercase;" class="no-print">
    <hr>
    <?php if ($message) { ?>
    <div class="alert alert-success">
        <button data-dismiss="alert" class="close" type="button">×</button>
        <?= is_array($message) ? print_r($message, true) : $message; ?>
    </div>
<?php } ?>

    <?php if ($Settings->java_applet) { ?>
        <span class="col-xs-12"><a class="btn btn-block btn-primary" onClick="printReceipt()"><?= lang("print"); ?></a></span>
        <span class="col-xs-12"><a class="btn btn-block btn-info" type="button" onClick="openCashDrawer()"><?= lang('open_cash_drawer'); ?></a></span>
        <div style="clear:both;"></div>
    <?php } else { ?>
        <span class="pull-right col-xs-12">
        <a href="javascript:window.print()" id="web_print" class="btn btn-block btn-primary"
           onClick="window.print();return false;"><?= lang("web_print"); ?></a>
    </span>
    <?php } ?>
    <span class="pull-left col-xs-12"><a class="btn btn-block btn-success" href="#" id="email"><?= lang("email"); ?></a></span>

    <span class="col-xs-12">
        <a class="btn btn-block btn-warning" href="<?= site_url('pos'); ?>"><?= lang("back_to_pos"); ?></a>
    </span>
    <?php if (!$Settings->java_applet) { ?>
        <div style="clear:both;"></div>
        <div class="col-xs-12" style="background:#F5F5F5; padding:10px;">
            <font size="-2">
            <p style="font-weight:bold;">Favor alterar as configurações de impressão de seu browser</p>
            <p style="text-transform: capitalize;"><strong>FireFox:</strong> Arquivo &gt; Configurar impressora &gt; Margem &amp;Cabeçalho/Rodapé --Nenhum--</p>
            <p style="text-transform: capitalize;"><strong>Chrome:</strong> Menu &gt; Impressora &gt; Disabilitar Cabeçalho/Rodapé Opções &amp; Setar margem em branco</p></div>
            <font>
    <?php } ?>
    <div style="clear:both;"></div>

</div>

</div>
<canvas id="hidden_screenshot" style="display:none;">

</canvas>
<div class="canvas_con" style="display:none;"></div>
<script src="<?= $assets ?>plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
<?php if ($Settings->java_applet) {

        function drawLine($Settings)
        {
            $size = $Settings->char_per_line;
            $new = '';
            for ($i = 1; $i < $size; $i++) {
                $new .= '-';
            }
            $new .= ' ';
            return $new;
        }

        function printLine($str, $Settings, $sep = ":", $space = NULL)
        {
            $size = $space ? $space : $Settings->char_per_line;
            $lenght = strlen($str);
            list($first, $second) = explode(":", $str, 2);
            $new = $first . ($sep == ":" ? $sep : '');
            for ($i = 1; $i < ($size - $lenght); $i++) {
                $new .= ' ';
            }
            $new .= ($sep != ":" ? $sep : '') . $second;
            return $new;
        }

        function printText($text, $Settings)
        {
            $size = $Settings->char_per_line;
            $new = wordwrap($text, $size, "\\n");
            return $new;
        }

        function taxLine($name, $code, $qty, $amt, $tax)
        {
            return printLine(printLine(printLine(printLine($name . ':' . $code, '', 18) . ':' . $qty, '', 25) . ':' . $amt, '', 35) . ':' . $tax, ' ');
        }

        ?>

        <script type="text/javascript" src="<?= $assets ?>plugins/qz/js/deployJava.js"></script>
        <script type="text/javascript" src="<?= $assets ?>plugins/qz/qz-functions.js"></script>
        <script type="text/javascript">
            deployQZ('themes/<?=$Settings->theme?>/assets/plugins/qz/qz-print.jar', '<?= $assets ?>plugins/qz/qz-print_jnlp.jnlp');
            usePrinter("<?= $Settings->receipt_printer; ?>");
            <?php /*$image = $this->tec->save_barcode($inv->reference_no);*/ ?>
            function printReceipt() {
                //var barcode = 'data:image/png;base64,<?php /*echo $image;*/ ?>';
                receipt = "";
                receipt += chr(27) + chr(69) + "\r" + chr(27) + "\x61" + "\x31\r";
                receipt += "<?= printText(strip_tags(preg_replace('/\s+/',' ', $Settings->header)), $Settings); ?>" + "\n";
                receipt += " \x1B\x45\x0A\r ";
                receipt += "<?=drawLine($Settings);?>\r\n";
                //receipt += "<?php // if($Settings->invoice_view == 1) { echo lang('tax_invoice'); } ?>\r\n";
                //receipt += "<?php // if($Settings->invoice_view == 1) { echo drawLine(); } ?>\r\n";
                receipt += "\x1B\x61\x30";
                receipt += "<?= printLine(lang("sale_no") . ": " . $inv->id, $Settings) ?>" + "\n";
                receipt += "<?= printLine(lang("sales_person") . ": " . $created_by->first_name." ".$created_by->last_name, $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("customer") . ": " . $inv->customer_name, $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("date") . ": " . $this->tec->hrld($inv->date), $Settings); ?>" + "\n\n";
                receipt += "<?php $r = 1;
            foreach ($rows as $row): ?>";
                receipt += "<?= "#" . $r ." "; ?>";
                receipt += "<?= product_name(addslashes($row->product_name)); ?>" + "\n";
                receipt += "<?= printLine($this->tec->formatNumber($row->quantity)."x".$this->tec->formatMoney($row->net_unit_price+($row->item_tax/$row->quantity)) . ":  ". $this->tec->formatMoney($row->subtotal), $Settings, ' ') . ""; ?>" + "\n";
                receipt += "<?php $r++;
            endforeach; ?>";
                receipt += "\x1B\x61\x31";
                receipt += "<?=drawLine($Settings);?>\r\n";
                receipt += "\x1B\x61\x30";
                receipt += "<?= printLine(lang("total") . ": " . $this->tec->formatMoney($inv->total+$inv->product_tax), $Settings); ?>" + "\n";
                <?php if ($inv->order_tax != 0) { ?>
                receipt += "<?= printLine(lang("tax") . ": " . $this->tec->formatMoney($inv->order_tax), $Settings); ?>" + "\n";
                <?php } ?>
                <?php if ($inv->total_discount != 0) { ?>
                receipt += "<?= printLine(lang("discount") . ": " . $this->tec->formatMoney($inv->total_discount), $Settings); ?>" + "\n";
                <?php } ?>
                <?php if($Settings->rounding) { ?>
                receipt += "<?= printLine(lang("rounding") . ": " . $rounding, $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("grand_total") . ": " . $this->tec->formatMoney($inv->grand_total + $rounding), $Settings); ?>" + "\n";
                <?php } else { ?>
                receipt += "<?= printLine(lang("grand_total") . ": " . $this->tec->formatMoney($inv->grand_total), $Settings); ?>" + "\n";
                <?php } ?>
                <?php if($inv->paid < $inv->grand_total) { ?>
                receipt += "<?= printLine(lang("paid_amount") . ": " . $this->tec->formatMoney($inv->paid), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("due_amount") . ": " . $this->tec->formatMoney($inv->grand_total-$inv->paid), $Settings); ?>" + "\n\n";
                <?php } ?>
                <?php
                if($payments) {
                    foreach($payments as $payment) {
                        if ($payment->paid_by == 'cash' && $payment->pos_paid) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->tec->formatMoney($payment->pos_paid), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("change") . ": " . ($payment->pos_balance > 0 ? $this->tec->formatMoney($payment->pos_balance) : 0), $Settings); ?>" + "\n";
                <?php } if (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->tec->formatMoney($payment->pos_paid), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("card_no") . ": xxxx xxxx xxxx " . substr($payment->cc_no, -4), $Settings); ?>" + "\n";
                <?php  } if ($payment->paid_by == 'gift_card') { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->tec->formatMoney($payment->pos_paid), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("card_no") . ": " . $payment->gc_no, $Settings); ?>" + "\n";
                <?php } if ($payment->paid_by == 'Cheque' && $payment->cheque_no) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->tec->formatMoney($payment->pos_paid), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("cheque_no") . ": " . $payment->cheque_no, $Settings); ?>" + "\n";
                <?php if ($payment->paid_by == 'other' && $payment->amount) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by), $Settings); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->tec->formatMoney($payment->amount), $Settings); ?>" + "\n";
                receipt += "<?= printText(lang("payment_note") . ": " . $payment->note, $Settings); ?>" + "\n";
                <?php }
            }

        }
    }

    /* if($Settings->invoice_view == 1) {
        if(!empty($tax_summary)) {
    ?>
                receipt += "\n" + "<?= lang('tax_summary'); ?>" + "\n";
                receipt += "<?= taxLine(lang('name'),lang('code'),lang('qty'),lang('tax_excl'),lang('tax_amt')); ?>" + "\n";
                receipt += "<?php foreach ($tax_summary as $summary): ?>";
                receipt += "<?= taxLine($summary['name'],$summary['code'],$this->tec->formatNumber($summary['items']),$this->tec->formatMoney($summary['amt']),$this->tec->formatMoney($summary['tax'])); ?>" + "\n";
                receipt += "<?php endforeach; ?>";
                receipt += "<?= printLine(lang("total_tax_amount") . ":" . $this->tec->formatMoney($inv->product_tax)); ?>" + "\n";
                <?php
                    }
                } */
                ?>
                receipt += "\x1B\x61\x31";
                <?php if ($inv->note) { ?>
                receipt += "<?= printText(strip_tags(preg_replace('/\s+/',' ', $this->tec->decode_html($inv->note))), $Settings); ?>" + "\n";
                <?php } ?>
                receipt += "<?= printText(strip_tags(preg_replace('/\s+/',' ', $Settings->footer)), $Settings); ?>" + "\n";
                receipt += "\x1B\x61\x30";
                <?php if(isset($Settings->cash_drawer_cose)) { ?>
                print(receipt, '', '<?=$Settings->cash_drawer_cose;?>');
                <?php } else { ?>
                print(receipt, '', '');
                <?php } ?>

            }

        </script>
    <?php } ?>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#email').click(function () {
                        var email = prompt("<?= lang("email_address"); ?>", "<?= $customer->email; ?>");
                        if (email != null) {
                            $.ajax({
                                type: "post",
                                url: "<?= site_url('pos/email_receipt') ?>",
                                data: {<?= $this->security->get_csrf_token_name(); ?>: "<?= $this->security->get_csrf_hash(); ?>", email: email, id: <?= $inv->id; ?>},
                                dataType: "json",
                                success: function (data) {
                                    alert(data.msg);
                                },
                                error: function () {
                                    alert('<?= lang('ajax_request_failed'); ?>');
                                    return false;
                                }
                            });
                        }
                        return false;
                    });
                });
        <?php if (!$Settings->java_applet && !$noprint) { ?>
        $(window).load(function () {
            window.print();
        });
    <?php } ?>
            </script>
</body>
</html>
<?php } ?>
