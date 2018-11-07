<?php defined("CATALOG") or die("Access denied");?>
<?php //debug_arr($comments)?>
<div data-id="<?=$comments['id']?>" class="singleComment clear comment by-current-user ">
    <div class="commentBody left clear">
        <p class="userLink">
            <a href="#"><?=$comments['author_name']?></a>
        </p>
        <p class="commentBody">
            Time: <?=$comments['created_add']?>
        </p>
        <p class="commentBody">
            Comment text: <?=$comments['comment_text']?>
        </p>
        <p class="commentBody">
            +: <?=$comments['comment_good']?>
        </p>
        <p class="commentBody">
            -: <?=$comments['comment_bad']?>
        </p>
        <p class="rate">Рейтинг :
            <a href="#" class="rateDown">
                <i class="icons">keyboard_arrow_down</i>
                <b><?=$comments['count_dislike']?></b></a>
            <a href="#" class="rateUp">
                <i class="icons">keyboard_arrow_up</i>
                <b><?=$comments['count_like']?></b></a>
            <input type="hidden" id="comment-id" value="<?=$comments['id']?>" />
        </p>
        <span class="block-answer">
            <a href="#" class="linkAnswer action reply" data-parent-comment="<?=$comments['id']?>">
                Answer
                <i class="icons">arrow_drop_down</i>
            </a>
        </span>
    </div>
</div>
<?php if(isset($comments['childs'])):?>
    <div class="commentBody left clear answer">
       <?php echo comments_to_string($comments['childs'], $template = 'comments_template.php');?>
    </div>
<?php endif?>
